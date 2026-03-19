Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883793988FD
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897798; cv=none; b=PPkjWRnKpmgooKHDEnjYUaOlc9muxfcvryvs1QPXcvSfmrufhZBq66jUlvZtt4UNgMUGEQHGSeyCVUwWW/2wfvYUP3KKoUYTpQwWKhMDTJY911mNyg2vTTfXATk4DSnS35dCYKqoFMyrtMAHWV8fiRN7rYBsH4HK54HysrS+Sc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897798; c=relaxed/simple;
	bh=G2zcgXUBBwUh7cls6/BZ5JBSgiMlwaZtMegf2/dfOYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cik6pPwVtSwqGFDWLMrFgnzB/gfQsBmdfzuMIQ5P60mAS9Dg44W4hTyqsEedlex0gKKUHclBHZuCoPoPxfoWZ2SfVZKthcpJ7/+DM2+8rH6OElItO6191YivlWAu0EfOV/F1Sf/4HSFAH8o/92W8dtJBLm+EuEWCJElZ3W+bqEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TxfgBSY4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TxfgBSY4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so4147495e9.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773897794; x=1774502594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Kt6aIgux67oUOjoEG7PdJUevFfOkA8mbhoewpRkzHo=;
        b=TxfgBSY4qB7+6MAkP0FA5hVFvepjxiJKLAxZbSeqvegbFA3Mgig3b9WIfVDTL8fd+6
         y0O07FcC21EZcATX3lTE1wI+IUUs/rKW4KPxkK4n0vF6QWCpXr16/RLVENf8/40VISk5
         oTGAMivVXJZck1hwADWm8hN5P+40hoz709c1y+lADOyoEW6jiQmll0sv1hFBTDtYIpg3
         OG1izc314e7rTLAsE4Sxw65cPkQtqhZneDAAWOk/Tf2rq346TffRyEkGaPtsO8M6grSA
         +UVM7L7pE5m9KzN632S9dUj8VG5LCm1MWwK0Z9oeN2eSiSLP/BklZqLhKHV9LFxGV69d
         v/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897794; x=1774502594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Kt6aIgux67oUOjoEG7PdJUevFfOkA8mbhoewpRkzHo=;
        b=JXRLirPBoB4oyE2jsFZs2ZTIJbx4DeFS3YknEEYVQ65PSrrvYs0HtNOe/ccHq4DZ8d
         9teTROmmWoD/B2cddvpcLjLOIWPfduiYYm57NBoiKQ3AA1RNQ8LsI7VKKReWg99Akssq
         YP0r+W+NUw6Az2w7khhbgwC4Aatq9L/pBCjuB5efQD3vR2bQTZu4u05R9AYJlGBPCluY
         vixrkAh604nOHkaK6zt9tAzTM8mqqWNuEF+prs2p485VGKjgV4plpeRp8cnj1CcRwORn
         nGsyQxZIHi/xoxDKbdZulsrE+S2NeUXcOsETLiYom8AFQP3MfbAAp6izMoZ2spg8hchM
         L9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWusp7DSmAMZBfFUAbmHiJBq9GeGybNcjoNk6JIHqJ86lSnTUfDAsxXNExoX6U9WxUUC+64W2Szh0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxulH6Jy/NtiWWsdepkMcyBZzTMaVfWHvtOminxVFygymPEliol
	EW8fvffep5MSTM9yb2Cnpdxbpq7gFfHic6LTLxmJ7ytWU5O1ppJiMHZDptrGpVXQMr0=
X-Gm-Gg: ATEYQzw1V9Wzc6rRcoaUSdJB8oL1bQBgHMDwXyJcBjwmugY8U/vDnwZuu6Hpac4N7tw
	aGdWrBofkA99lggznxUVL4THOcAE1+AoZRpwzCU9QjIgkfJ0uRUOavxoreRyr1jDkwmF10fPoyi
	bflisJQUILxrEryj+1PkG5KhmHg2EbOyJ2uqrQkJN/FCX9owaf691iHJGwOhZajfiP/rFK/jtfC
	gr4esHtXDegt6/ohq7rpxEbDvuxUnce6IZISImFvdSlSPixrxEJrvNeo+y6xeEKATDX139md4pr
	8Sz+fzPo36GmgvcncIeXKKJ93yQxqLtflgXMdhiGQJVW5VXZo7tT5wh7c5yuHqGZCn/JtQdnOpI
	HVN/ZMxmvYPcu2WUv9uezsCMQsxuNc42KAQijSrMOXfZcUDrVtuBvVUuJ1Mjyt5TuFfcbQGMzcT
	Rv3AqEaejcj+ae0e8R0lh4FwcGTvj1Wg==
X-Received: by 2002:a05:600c:1d0b:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-486f4577061mr101262955e9.31.1773897793836;
        Wed, 18 Mar 2026 22:23:13 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8bd5f7csm42340265e9.0.2026.03.18.22.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:23:13 -0700 (PDT)
Message-ID: <9e97bf7d-57f2-4c25-95e0-84d63bc48e47@tuxon.dev>
Date: Thu, 19 Mar 2026 07:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/26 13:15, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add clocks and reset entries for the PCIe controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
