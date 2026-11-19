Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055039;
	b=mLE/VVLnZfJLXlFdwpt+HtGQuI/eM1K7Yq3iQ6NI+udsgmdL6q/MaQEy6TXvpsrt1H0Y
	 6gnnD0bMbWKcrhNsiiVSNfbjehLpoPSBCIi9zURhNjW3imCn7aPY3hYnKrjsiP/m6DUgD
	 xHwT0LUvb9BkS3tRYSH9Wr60fsqsuizY6RNoAzumfYu5sP5lkvZJNxI8OoLjMGvhgSO3C
	 hY5n9s4ns2yCDpKXpxxbnjSsgyvfTOCvxApLgNP+JIP9R1qx57xMwbG0yyEqq3HpZIvEr
	 thGIB5Z39A1pW8xUkHn3iFyqF9FEn1ByhyHwFTNEfvyqpZXo1+CkfElFEjL7t3yHDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055039;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=t7bMvs3lOLPl1TDYCI2zC+6rhjTkCkzXglZIMlkd5+k=;
	b=rRV2x8oX1/zelaKHklfMa7ljr9PYbitE+mWI1sNIZ1EpPq6dILF3kzgK5s1Li9FLhZV9
	 PV7XsectKJ5sFap9w3HTQ4lwWnefsYxqVh8IlvluYN0lCHAwrzH/Q7JlLuF5CaDosSTE2
	 eRZb0GclKr1aykdUueTEKiMbG7s64qyddnlyCGS+VAC+79uFHmA6vjBaPaVv0D7tNgG5K
	 oh/Tt3DIyxqNtDDLxolKyZxTv//K05V4UUpLPF29NAHFGT4UgbV8Bud3wVYpvZJ9J/NDb
	 gam8P4hdnrxSsa90+9dLYlXk0O9gU4NZS/ytcbM71yOSITCA/TZtXD2fpXsvYvhrd6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FkMC/PW7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBC606A31C;
	Thu, 19 Nov 2026 02:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkMC/PW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5189F1F000C4;
	Thu, 19 Nov 2026 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795055038;
	bh=t7bMvs3lOLPl1TDYCI2zC+6rhjTkCkzXglZIMlkd5+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkMC/PW7Y1+qnoXmqOsCT+x/q5Gavm0C3K0CFZ2kjA47d6u18CoYUNL7rrCI+m3ug
	 jTp3laT5FcallKs2mH1tMIM+pmmeQgVIJ0LhJMQYYHbf1jegSuw7NCG2Inu1bOyrWT
	 I6cgUbijNjw3LOG7CVmLUIhdusLvePICdZAxvZ3g+7/cXLk8vvTgWzUCyCYe7JUfaG
	 aghsmPVBeHKZ2RSwFjqQD8BrsMddzAe2iJ0VkS6K+EfT/QrJPQwaufHno1sjpJtSUA
	 jLKinbrg6YJiFJPrH7gI8StE62tCzLpegY3MvtH+hKHhUagM21A766K6EJem7mykeE
	 qv4CPXg59TNuA==
Date: Wed, 18 Nov 2026 21:23:54 -0500
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <av5dut67EajT0zn3@x1g10>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-7-eleanor.lin@realtek.com>
 <179450369605.1227210.10143810675268582312.b4-review@b4>
 <54a7a77705674bfdac23727f5fb92cb6@realtek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54a7a77705674bfdac23727f5fb92cb6@realtek.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Yu-Chun,

On Fri, Nov 13, 2026 at 02:12:59PM +0000, Yu-Chun Lin [林祐君] wrote:
> > > +static const struct rtk_clk_pll_mmc_rate *
> > > +rtk_clk_pll_mmc_find_closest_rate(const struct rtk_clk_pll_mmc_rate *tbl,
> > u32 num,
> > > +                               unsigned long rate, unsigned long
> > min_rate,
> > > +                               unsigned long max_rate) {
> > > +     const struct rtk_clk_pll_mmc_rate *best = NULL;
> > > +     unsigned long best_delta = ~0UL;
> > > +
> > > +     for (unsigned int i = 0; i < num; i++) {
> > > +             const struct rtk_clk_pll_mmc_rate *entry = &tbl[i];
> > > +             unsigned long delta;
> > > +
> > > +             if (entry->rate < min_rate || entry->rate > max_rate)
> > > +                     continue;
> > > +
> > > +             delta = entry->rate >= rate ? entry->rate - rate : rate -
> > entry->rate;
> > > +             if (delta < best_delta) {
> > > +                     best = entry;
> > > +                     best_delta = delta;
> > > +             }
> > > +     }
> > > +
> > > +     return best;
> > > +}
> > 
> > This duplicates the functionality in ftbl_find_closest_by_rate() from patch 3.
> > 
> 
> I considered sharing the logic, but the two tables have different entry
> layouts.
> 
> Unifying them would need a macro or (void *) (both lose type checking), or
> embedding rtk_freq_table with container_of() (a larger rework for little
> gain). I prefer keeping the two type-safe functions. Is that acceptable?

What about this? This is completely untested.

  #define ftbl_find_closest_by_rate(_tbl, _rate, _min, _max) ({         \
        typeof(&(_tbl)[0]) __best = NULL, __e;                          \
        unsigned long __r = (_rate), __lo = (_min), __hi = (_max);      \
        unsigned long __best_delta = ULONG_MAX;                         \
                                                                        \
        for (__e = (_tbl); __e->rate; __e++) {                          \
                unsigned long __d;                                      \
                                                                        \
                if (__e->rate < __lo || __e->rate > __hi)               \
                        continue;                                       \
                                                                        \
                __d = abs_diff(__e->rate, __r);                         \
                if (__d < __best_delta) {                               \
                        __best_delta = __d;                             \
                        __best = __e;                                   \
                }                                                       \
        }                                                               \
        __best;                                                         \ 
  })

Brian
