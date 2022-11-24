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
  it("Jungle add product to cart", () => {
    cy.get(".products article").first().click();
    cy.url().should('include', '/products/12');
    cy.wait(500);
    cy.get(".button_to button").click();
    cy.visit('http://localhost:3000/cart/');
    cy.get(".cart_tbody_test").should("have.length", 1);
  });
});