describe('', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it("Jungle Visit", () => {
    cy.visit('http://localhost:3000/');
  });

  it("Jungle navigate to product", () => {
    cy.get(".products article").first()
      .click();
    cy.url().should('include', '/products/12')
  });
});