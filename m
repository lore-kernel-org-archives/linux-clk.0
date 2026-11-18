Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996081;
	b=pljHbT5ZwL6T7l+TbRVEzzdCHNXFEd/e+fBG0aXMN3aCk9XKvBII14hwd1zMN+/BkPvm
	 HOHsLPK9+1+vprmhZuhds2QCaQjTH3DTDrU0XDlM7vrHfbJZHUsi3xgqBrBGBGC6ghmdU
	 lSS6zDPq9Jdu1/QjtW4WbkGcPExpdKU5yFP0ARsOglyYwWEYsSm5M4nZ3HNClkh6RbQyW
	 597OhhLCKFquy7dAk5L95IhLIzdojtaBjWsedQE3s0RhGo1b+3tiLvHznuUlIzVg5KrnV
	 UurldzFOYs5z1vKh6WzPkmEQqAFV4jhduei319pygoxPFEw/UKclVi/B2IaRmbsOv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
	b=YAgZCGRN+x570IpFeHLKiGfArAX6i2gRPg9vJwBhCJfd/RNiUaM/WcAf23Q8fDWfNCwa
	 o0HVBi7l9rc+Boj4VX/imqW3wL1U9lDJa44EPq2lBlaTUQJpIOwrbLbt81Ngd+UZFttZf
	 MBk4AKwD5EIR8fyZgstNghZiO5sjAjQF9ltomm8HVAvz9PPAiXOTzR9IQVE3KLtXVfDeH
	 ck0S/N0sOwUl/jB8lhDxNGk9UMrbb7QJvEoM0/y4tFDyLMQ96GIUd9r63lnzKykuQQ06k
	 O3wTrpVsi7VryaaePXEHzeecEM5cKfbctvYecdI86JvKR/+N7y26h3zaFvQ+1qvbNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40E606A32A
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F40E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so7916755e9.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996080; x=1795600880; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=NXWSjALHejmhCRttwQozmx01nKaGgerN7LqPA50/6M/Up0+oOC7WYwnske2NEfpBj/
         YwUYxX8x+tCnf9iOLp55QQMNxSUgR0LDbGsi9DeIQ/RubdWjsMckzmNbxDtBS8N+Pu9A
         Be87Qq6Yqf6fj29/0F93dnvNOcMHwb7Or2RVaOkNyPTovsmfWOcZ6XuHH4ZmEYxYv1kz
         OmXTaDorO35YQvd8ePOrSpHnTlTxN4c6xlkcO52I5y1JFN3PfhZvxiB8M73etRzafEA+
         wqH5dWc/uUSajzaqItwMe4ige1CnmIaqPPR8HmZT1D0L35bwdIae6+w0D68NPj7OSNKH
         G+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996080; x=1795600880;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=GHxdfcboeu69gzpwGK3BzFP88YLWw89jOLCOwk6Nz32gevp6s9T2p12nJQuk9P5Xoc
         HnQfCFgekCnh/MabnliQAKKycaXwZ+AG6jVwz34h2DuIrOoo6Xz68RrwC+XdGVEOy/ya
         MD4VY/xLoLt9QDXIN9UyMigcTNVX+wDOueD3fqsF1DusAHIlBjT7AKl3YRWDxowAJDVY
         QN7qOiox9SdR8vxVoydenqcHRBiQ8zMSuL5gAft86lLZyO+07Vpb7EDVFJo/U0xHR1IA
         0lNRKRCbDPsqDJl9vSCfmDslli6tSwS9YE0XSw8JFB4OgVI73MqgCvHzhOZASsbKgrYc
         RFSg==
X-Forwarded-Encrypted: i=1; AL+hErFEikx1PkzmseX8aBcnWKYz6exdoqULnYw+DndFUPkxpevaF4IYe0xDpd/gb8diZdlgOTUSsUglWtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+efR23nB8daHLmtUxSkCWQQzCwtwA9OXFBnPGZClZmbBBgLo66
	vY0nUyazcxYS8KcK9lZ7A9JYxDQUa1yZpSqK8hQl9htXH1gkQmN5w+iFMn+W2Q7HSzk=
X-Gm-Gg: AYBFou3gPKxT6B+KBLAPX/FJzSQlnjvgE+iSNgGI2Z8axENxG+GCwYZib0qivw1/hE7
	0CG8ykgB7ZenRDXrkebgI7bXT3gn8qNODk44XPQiQ19fUf1uX8kBMf93DUwGqV6tO0zHe1RbIdJ
	CyHeNGhlYKZJpFsv3129jrqeHGE0tCr5b7SRlfV59PQi/ojPK5wAT+brxt/8tu6ebuzCKq/sSXu
	WZYuRjeboUAe/wDcxDR7bSiouBGB/DiDe7naDe/ZQmhugByaepVbx0RsG+f5h+AM7xVNQaTGRVJ
	/6SLt6X3xWJ6I4RL4iN5b5y8VqlFLFQMV1OH7fKTB48Lt7876EL0dB0VbYr3Ep/FtJwZ8Alkzh/
	XHFqStC5JIvRBsIo18DwlFSlfrLW6t2pm5Mw4U5/Ke42bvfXzoprrjC/HEh8WHgj8krSLKOlvsI
	xIPxQ7AcxflIeIyW7RN/mEm/29JDRqeJIP/aCTANUvPVlO52QYnKKaFN5MhKDSt63XoiZOvWEVz
	X7A5QHneiwYCrD2wXkkpM2on2onOUz913tlU5B29J/3k0zBGBFhfo/F1XuRl51RbbfPiETp9B1V
	g8e+4Gmbxn3gk1A8cywY0dCCVzk0tIl0h8mo4kyG5+BhITmq
X-Received: by 2002:a05:600c:4ecf:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb7da2eaa2mr40922415e9.23.1794996079988;
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm3910716f8f.21.2026.11.18.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/7] clk: meson: pll: Support active-low resets
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.553972685734176286.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q33DSpltm5vwmAzvC7fHaPbc9BM0xB8WQVVAhH5UiqE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3PKLqkKiK4KL9OeNlVYi5vpyrLt++ZICz9b2v0+M
 NKhqSS7o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPhO8bwT/ObRNYFFWbhO4dv
 lmje/SC04FFI1KPbrlWh23OnJe9KCGH4H76H4dc1wYz1vUpzPhXvOsXz0cWI/2B2iGTEnGvxN0z
 LOQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that the reset of a PLL is active high. The
> S7 HDMI PLL has an active-low reset, and its lock flag only rises
> reliably when the PLL goes through it.
> 
> Add a flag for PLLs with an active-low reset so this PLL can use the
> common implementation.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 44b33051405f..4ac5e45c1e9b 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  	return -ETIMEDOUT;
>  }
>  
> +static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
> +				   struct meson_clk_pll_data *pll)
> +{
> +	unsigned int rst;
> +
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return false;
> +
> +	rst = meson_parm_read(clk->map, &pll->rst);
> +
> +	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;

nitpick: exclusive or ?

> +}
> +
> +static void meson_clk_pll_reset(struct clk_regmap *clk,
> +				struct meson_clk_pll_data *pll, bool reset)
> +{
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return;
> +
> +	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +		reset = !reset;

same here.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

