Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3530748A
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108408; cv=none; b=aU6WwD2L7DvEHsECU4xPFE2duYJ4vcpfW2bNI7WFlTEGW29FcC9jecPldqisH9V042IqeelXm3dqlZozYxe/f8jsafM4y0lznzp9nmS4nz7Okcna9AXIZ9zd5IBAS5h+PoMfuPsI5+pQQQQvB7bdNyFQfBofYSHKv+U8KzyHYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108408; c=relaxed/simple;
	bh=EuwPVtHyZtk0Y1lc41SsIpHNM6KNvdVwwJODJaVH/gM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pkzjmKiR9kgBsKbbrBRcMbj1xz0n3Xr+FZQYl0Wm3bSnzokEOBtlCPypBbDBzlUoGhsQ5mwhqt8Jn3UUWPTti5XJPSgj1L8WBTDcjXnbbNrNzrLPu39n40C871SHiLr1uzVPFwSxpW206PGafSC0U1p7uxEyg47kIma1Zq/zAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24c8ef94e5dso22276295ad.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Sep 2025 14:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757108406; x=1757713206;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xirptwLPscOOrD6MjERvQR7+JKo3MLBeTIYrgAFmkYE=;
        b=wW77v3VEUV+btV0NFRxbTAqWyF9NBUd2t7gzGIQicdzzpywhrMEKr84/qKU40aPrMq
         HQzu8MNNtlq0E8+/sa67DV5WsomQ4WF0nUTfBna56OFFoj6iqan0vV4VAPwJI/z5jB3F
         PyNv9m6YJaF200FmbdfnzlElqPn0gVOv8hjLfpHxqNUb1LEioeUKo6UY8LT+sTTXf+Eb
         YKIMIHpfkpC6tbFvHMorZLgCJNo6Y9F0Ua1sRWIW9vKUaYH1eqhq42Hq20nfE3QDOB1q
         uAUFF25hzECOuqPucvUpPU5suHaaqTSLY8CqKwG9EH9JZXtu7wVAyTSsw1fs0pP6Yqej
         /mFA==
X-Forwarded-Encrypted: i=1; AJvYcCXE6Cj8oXQG0/Z8G6RPO6CkovApmlx9H+SchuSlSU8DuN7oEcl/JsKY+mVsx8kNYcxDlbkeScbfj58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTwsniTwHQ/V2jLtlVNvxg+rcLzDW5pLSiGN2grjiunForlJh
	793gn4yqlA5lb2C65JkhRSJkSMdLASaXEwaRARmmsPiWweXLBVoNhI+eMw/s1WLshvLRZoCyYRr
	vXd+n
X-Gm-Gg: ASbGnctK5JC5r309ytgsUigIzk44PtlWIa3fm2NNfxWwWE8st67VQPsyvQbwVJZT0GH
	11TyqFjAW14seyZnYmAMOWwvxJWYmoyFZ++jRI+XfNBRc14tT33HA3f/MoGvtpLNpWsb0rwzc3f
	QIxqFINggerKUYdsBnEXX/yjzBZP37yKoWYF3yBgFZyLbOff51LGTvcWlLf8te0CU7KEuKVUhPE
	j799ZnFBVv52+MzTm4JjfYVOAg+CDxk/2w1H7Vy8FSsV+2IbjLRdbUCPVXUpj7YWuK2ziDam7q4
	AIeBQXaTScyhoNs/6JRSUwB5g9SmTBIrS3IceHVcKue22s7IzIUr1LRwq0LKG5NWj1zegQTSerS
	41Xn/XDn1COYGqB/vnlII
X-Google-Smtp-Source: AGHT+IFw9MwANXAgB0eCLMrfpT9FSIah/S2jHqgdaTFzPWLL5Scc72YKTjtxBqxKZTvx50aR9gsoUA==
X-Received: by 2002:a17:903:1c2:b0:24c:affd:6f00 with SMTP id d9443c01a7336-24cef52790fmr57400485ad.14.1757108405639;
        Fri, 05 Sep 2025 14:40:05 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9df827besm74488265ad.152.2025.09.05.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:40:05 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Tero Kristo
 <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Stein
 <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
In-Reply-To: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
References: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
Date: Fri, 05 Sep 2025 14:40:04 -0700
Message-ID: <7hms78a897.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>
> As described in AM335x Errata Advisory 1.0.42, WKUP_DEBUGSS_CLKCTRL
> can't be disabled - the clock module will just be stuck in transitioning
> state forever, resulting in the following warning message after the wait
> loop times out:
>
>     l3-aon-clkctrl:0000:0: failed to disable
>
> Just add the clock to enable_init_clks, so no attempt is made to disable
> it.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/ti/clk-33xx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
> index 85c50ea39e6da..9269e6a0db6a4 100644
> --- a/drivers/clk/ti/clk-33xx.c
> +++ b/drivers/clk/ti/clk-33xx.c
> @@ -258,6 +258,8 @@ static const char *enable_init_clks[] = {
>  	"dpll_ddr_m2_ck",
>  	"dpll_mpu_m2_ck",
>  	"l3_gclk",
> +	/* WKUP_DEBUGSS_CLKCTRL - disable fails, AM335x Errata Advisory 1.0.42 */
> +	"l3-aon-clkctrl:0000:0",
>  	/* AM3_L3_L3_MAIN_CLKCTRL, needed during suspend */
>  	"l3-clkctrl:00bc:0",
>  	"l4hs_gclk",
> -- 
> 2.43.0
