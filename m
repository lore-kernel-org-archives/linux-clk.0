Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Emilio Lopez" <emilio@elopez.com.ar>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1445326609-6314-2-git-send-email-maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 "Chen-Yu Tsai" <wens@csie.org>, "Hans de Goede" <hdegoede@redhat.com>,
 linux-sunxi@googlegroups.com,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>
References: <1445326609-6314-1-git-send-email-maxime.ripard@free-electrons.com>
 <1445326609-6314-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20151020134343.20687.16333@quantum>
Subject: Re: [PATCH v6 1/5] clk: Add a basic multiplier clock
Date: Tue, 20 Oct 2015 06:43:43 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Quoting Maxime Ripard (2015-10-20 00:36:45)
> +struct clk *clk_register_multiplier(struct device *dev, const char *name,
> +                                   const char *parent_name,
> +                                   unsigned long flags,
> +                                   void __iomem *reg, u8 shift, u8 width,
> +                                   u8 clk_mult_flags, spinlock_t *lock)
> +{

Patch looks good in general. However this is a good opportunity to stop
the madness around the registration functions in these basic clock
types.

clk_register is really all that we need since we've had struct
clk_init_data for a while. Initializing a multiplier should be as simple
as:

	struct clk_multiplier clk_foo =3D {
		.hw.init =3D &(struct clk_init_data){
			.name =3D "foo",
			.parent_names =3D (const char *[]){
				"bar",
			},
			.num_parents =3D 1;
			.ops =3D &clk_multiplier_ops,
		},
		.reg =3D 0xd34db33f,
		.shift =3D 1,
		.width =3D 2,
	};

	clk_register(dev, &clk_foo.hw);

This is nice since it turns these basic clocks into even more of a
library and less of a poor mans driver.

(I really hope the above works. I did not test it)

Is it possible you can convert to using this method, and if it is
correct for you then just remove clk_multiplier_register altogether? (In
fact you might not use the registration function at all since you use
the composite clock...)

Regards,
Mike
