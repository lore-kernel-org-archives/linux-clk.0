Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5A2BFC85
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303408; cv=none; b=cV764tvWZtY9UWtNRdErmYIAv9GCe2E4q/NHeXeKx6AZWEtTjggSXc7VKfbtWUuOioWWYYBCAV++1RYBV27/6uxm4YVJvQ25+iMoIsdhzvwA34UaA3SAUsgpZBJP98hCi37wo/3bkFBFl5mfP2NOapBimJFo2Yc41B03wDsO+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303408; c=relaxed/simple;
	bh=Pj+p1BuyTbovgYZ9ca5qqpgdEfYIufLbDjEWBYmS9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxRySJEzMAPbNGFXiL+HpH/QhxF0655KVz3+npizsPYQOK94JdTCFanMPITmbTuxpd2b6Rdkmf0j6dwD2u81izIRF6nxFdGHvbqIhXokdKJsWrJ1QzEmY2BqSvRV3N5CL3BJCWX9/yzp2PmkJPLGdf/RjefceScLBDun5DGLk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cBQxNg3h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wf1Cqj2w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cBQxNg3h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wf1Cqj2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777303406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
	b=cBQxNg3hzcINaIWuB+bRHy10Lt+MesqIa7WwS5Z7cBq5NnXu0oNbNRe9m+BJwQbMThNQEB
	sVHQXQ3MU+Kl5QsOtJr+FdVQDmSA8uHQENy+CbuFsXjg2gvIfdjx7r2LCbYkn9nG5QY9Ll
	HG2yASC4b7chjeCjwoMh9J90hKpaGic=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-IgyJPSXIMCijIImrAmg1PA-1; Mon, 27 Apr 2026 11:23:24 -0400
X-MC-Unique: IgyJPSXIMCijIImrAmg1PA-1
X-Mimecast-MFC-AGG-ID: IgyJPSXIMCijIImrAmg1PA_1777303404
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so221108171cf.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777303404; x=1777908204; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
        b=Wf1Cqj2w/Lh3tD+brorCKgQVKB7T/dK8m7IGgtQivE8Om0kyQhziGks99HwtqBLrTJ
         yqkLAzKAxMSr8ygWmXxdskUFrYTT3vMs2wD0EBrAGjWCF9RqG4bzpQgN1pmMuUdd8yK/
         o5FYPKaOhIeiQzKX+xWDdJSU6N8kPfNb8igliUpmBn/H056OsVMPabY2WpwXng7FyuEJ
         9RUBVEZ1mnmkf3VHM+oC7umWKaiuKqSCkAninzN5Nsw0Rz1XAWu7AIws7sb1WWtFueR0
         2djDV8MYB1BX18PymM238nIivA/jeGAk2/LYR3I2f16UgA/t6lCFOqRfSZeVe0i9ZpxE
         WoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303404; x=1777908204;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
        b=FeJPbpTABxKqJCl5g6QNr0ovM9FWh94cM5okjS3YGgalgOXy3ZweiS/Yi5fqFKAnlS
         juB+o7pwOxtK5zqT6d0+hqvjFAdGqk0NJ+FbtUko3hcxwDxlcya3Uo8L5NpU71Dextxt
         6hFlO+3MAGC8rfss8AfZVIa8OB4+5ApKsPLtcjHKwfm34sE+NcLjubRaW3XV/WQBVsWv
         oJ1F2Gj65pOrgJrc9+LOY1hBRwm36rBhCROeWF1vfwpewNkieJ7tr4gqiUPnEkPi7non
         RvR9L+HBiwXcHrJYwSoV9gHAAwaq5UAEU1us62AqgPfN7xXxH0WNp79MJmujyHk84CRL
         i08g==
X-Forwarded-Encrypted: i=1; AFNElJ/Xw6GOJklKS6XYwVvlO7OoaYabXkmtc0S3Aj2DKDgMg2ZpnegGKcQEulZEdNfoPa7743bHWcQDxcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoow1EzdcZSt/DihTDRmdLGFkIlIVVmcgCsD0H9fxZSCze3wYC
	yn1vUjz1GxyyqqnHiv1o/lNfR3bEleWfq5tySq/qixAZt9l2ThQKvU4BGBD+IZhoilRQrcJYItk
	mJ/Z0wCsuil8SoszXdeR/Kte32seE7oSyfUSME2GXxPQUD4GxxImk6nrUUI3OF87icBZw5g==
X-Gm-Gg: AeBDiesAHRgtukWTAhNFcMjaNlQCdtTLTQ99NWRXkn0mklrmlHL91LQgTSw09j4NfBY
	W6aH24nl+ZhfTM1mILn4UOfZ9Nnmb2kksdqYSMeL/V0+4DLvEp5aaf6dEzLEFKCwWEAP/0e/x6I
	nLN0DBq97p6WGMZHsLq1WQ1O6x2RrpBzf3xYnK5341b/pi6+qNLjbpr1O/nggMmi6upWTUD1Nfo
	VhwKQ0778GPGBFV8j6MXOL83ayeQSW45PHhq20JKrY3dElMngeLf6rEYZBBxsEG/Y8lWWIEXVKG
	goZWhRWOrm+QtuYGv/dT9uYslKun65u0yuxdFt/tTjfP1MsK3FaWkumNRcq/9tXtIDvuHSGz1PH
	pKEbUHXOpo575diz+04jt7rpZpIdF3wLyPVSvBoEMQCf4OR2waMK9lGvgerLto/eesPo=
X-Received: by 2002:a05:622a:1f97:b0:50e:2b1e:9d14 with SMTP id d75a77b69052e-50e36c11e04mr621669381cf.29.1777303403997;
        Mon, 27 Apr 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:50e:2b1e:9d14 with SMTP id d75a77b69052e-50e36c11e04mr621668781cf.29.1777303403489;
        Mon, 27 Apr 2026 08:23:23 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39449e36sm338531351cf.21.2026.04.27.08.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:23:22 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:23:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
Message-ID: <ae9_afsqmGDcczhW@redhat.com>
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Lad,

On Mon, Apr 27, 2026 at 12:28:23PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> clk_round_rate() is called with ULONG_MAX, which is the canonical way
> to probe the maximum rate a clock can produce.
> 
> Two test cases are introduced:
> 
> - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
>   fixed-rate parent driving a table-based divider whose smallest entry
>   is div=2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_MAX)
>   and checks the result.
> 
> - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-input
>   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead of
>   the same table-based divider to verify correct parent selection under
>   ULONG_MAX.
> 
> Both tests use an explicit clk_div_table with a minimum divider of 2 so
> that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> 
>     maxdiv = min(ULONG_MAX / rate, maxdiv);
> 
> clamps maxdiv to 1, causing _next_div() to return 2 on the first
> iteration and skip the loop body entirely. This makes bestdiv fall back
> to the maximum divider, returning the minimum rate rather than the
> maximum.
> 
> The expected values intentionally reflect the buggy output:
>   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
>   - test 2: 0                      (invalid, loop never populated bestdiv)
> 
> These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / 2
> respectively once the fix to clk_divider_bestdiv() is applied.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[snip]

> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test,
> +						  (kunit_action_t *)clk_hw_unregister_fixed_rate,
> +						  parent_hw));

You can use KUNIT_DEFINE_ACTION_WRAPPER() to avoid that cast. There's
some examples in drivers/clk/clk_kunit_helpers.c.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

