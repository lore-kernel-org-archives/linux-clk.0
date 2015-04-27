Return-Path: <James.Hogan@imgtec.com>
Date: Tue, 28 Apr 2015 00:00:22 +0100
From: James Hogan <james.hogan@imgtec.com>
To: Paul Burton <paul.burton@imgtec.com>
CC: <linux-mips@linux-mips.org>, Lars-Peter Clausen <lars@metafoo.de>, "Mike
 Turquette" <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 25/37] clk: ingenic: add driver for Ingenic SoC CGU
 clocks
Message-ID: <20150427230022.GB22974@jhogan-linux.le.imgtec.org>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-26-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
In-Reply-To: <1429881457-16016-26-git-send-email-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Paul,

On Fri, Apr 24, 2015 at 02:17:25PM +0100, Paul Burton wrote:
> +static int ingenic_clk_set_parent(struct clk_hw *hw, u8 idx)
> +{
> +	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
> +	struct ingenic_cgu *cgu = ingenic_clk->cgu;
> +	const struct ingenic_cgu_clk_info *clk_info;
> +	unsigned long flags;
> +	u8 curr_idx, hw_idx, num_poss;
> +	u32 reg, mask;
> +
> +	clk_info = &cgu->clock_info[ingenic_clk->idx];
> +
> +	if (clk_info->type & CGU_CLK_MUX) {
> +		/*
> +		 * Convert the parent index to the hardware index by adding
> +		 * 1 for any -1 in the parents array preceding the given
> +		 * index. That is, we want the index of idx'th entry in
> +		 * clk_info->parents which does not equal -1.
> +		 */
> +		hw_idx = curr_idx = 0;
> +		num_poss = 1 << clk_info->mux.bits;
> +		for (; hw_idx < num_poss; hw_idx++) {
> +			if (clk_info->parents[hw_idx] == -1)
> +				continue;
> +			if (curr_idx == idx)
> +				break;
> +			curr_idx++;
> +		}
> +
> +		/* idx should always be a valid parent */
> +		BUG_ON(curr_idx != idx);

I think this needs updating.

If idx is the number of valid parents, this won't catch it, e.g. idx =
2, parents = { x, y, -1, -1 }, it'll increment curr_idx twice to 2, and
reach the end of the loop without finding the 3rd valid clock, but
curr_idx == idx == 2 ...

> +
> +		mask = GENMASK(clk_info->mux.bits - 1, 0);
> +		mask <<= clk_info->mux.shift;
> +
> +		spin_lock_irqsave(&cgu->lock, flags);
> +
> +		/* write the register */
> +		reg = readl(cgu->base + clk_info->mux.reg);
> +		reg &= ~mask;
> +		reg |= hw_idx << clk_info->mux.shift;
> +		writel(reg, cgu->base + clk_info->mux.reg);
> +
> +		spin_unlock_irqrestore(&cgu->lock, flags);
> +		return 0;
> +	}
> +
> +	return idx ? -EINVAL : 0;
> +}

Cheers
James

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVPr+GAAoJEGwLaZPeOHZ6d+YQAIgI9O1TVk4wMmfAVdV3SIkh
7//bZhJGeDGJdHP3fVW+mUJ16V0oabiCfqUMp/SFqrQ5sRYwBzr3eHWFnFrDvt7o
thnt1FYMri95jcSninnl7YlXM5R9djF1wp2UgZE50rXlhSjkbqQVtv4ODDrR5F2O
oJWpgRmi7Bw+zynA4Iji9alAiwZjJRQYqpN6wtpugXofVhR2y5GHlCQqNuB6Rm+7
NbuFtN6SE/hXi8DD2p75Hy7EDODXD08pCNrvp9Pg2YAiNvoi8dtafCPqVWG8MniU
nUUWAYeRpgt6w1B6EXQz+13W5PPucNFUwvRgVqRcQ3kQzj3eB4JtJjQ0mfwmrX7i
i57L/y0oCIN2fvBaC6gbQLiUahUHia4D3t2i/brPs/p4MhiSiLn7DDNMg7GWnSCe
i6OzCxlr+fT3/rIKrAoKYa6IFeoJgAN9b5fNuMu12ko5/LSBWhqn8ojE/5Mpv9DQ
j/Waea+7jUMXOVRJndlGWKSRf6Qm4HeRhpK3sfd5Sy+on+w9a+ybM69x8l1knmnS
LZhJACyv5uJIwEceTvVkmnOLqXUhRjax86lt7Lvwx111JqkNQToqIEHRSp8mSTxN
tDIS/1vX1zPhuGwZBXVp8/P0BVUIL7r1fijfJYwKWf3dJP4QEil0HPR8y1iDMa9O
jAh2RO1JjDUy8NCfaOEx
=42m1
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
