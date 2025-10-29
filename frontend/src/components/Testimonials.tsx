import React from 'react'

type Props = {}

const Testimonials = (props: Props) => {
  return (
    <section className="py-12 md:py-20">
    <div className="container-max flex flex-col md:flex-row items-center gap-8">
      <div className="w-full md:w-1/2 flex justify-center md:justify-start">
        <img
          src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=800&auto=format&fit=crop"
          alt="user"
          className="w-64 h-64 object-cover rounded-lg shadow"
        />
      </div>

      <div className="w-full md:w-1/2 relative">
        <div className="p-6 bg-white rounded-lg shadow-md">
          <h3 className="text-2xl font-bold">
            Trusted by creators worldwide
          </h3>
          <p className="mt-4 text-gray-600">
            “MeshMarket saved us months of work — their tools for automated
            optimization and format conversion were a perfect fit for our
            pipeline.”
          </p>
          <div className="mt-4 text-sm text-gray-500">
            — Alex Park, Lead 3D Artist
          </div>
        </div>

        <div className="absolute left-6 right-6 -bottom-6 flex justify-between pointer-events-none">
          <span className="w-16 h-2 bg-gradient-to-r from-accent to-primary rounded-full opacity-40"></span>
          <span className="w-10 h-10 bg-primary rounded-full opacity-20"></span>
        </div>
      </div>
    </div>
  </section>
  )
}

export default Testimonials