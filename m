Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704062;
	b=1ag8/vMNcGLQbl+ugAC6n1K5diY5H1XNiGjzrV7cV9+gmdWOUDCf9x9UwfPByvCpcrry
	 r57Fv9Ko0vjnXX/+DRideON9KhhA4A9WU/xkDIIhE+GfsyvivtTVVT0n+cPk/KkFuvl2Q
	 IqCsRkrrab8XHdGxmyTWZUu6gaKHEvPZFVLmk8U8MLUMFKaP1AcIMULbz0VpCX/gEdKXo
	 ldcjdT9+ZyuXxXWjX38/eL9nZnKaYgZpHHZoJWKZ50lWyXEgGHKdcDpyTN28sAO8p1hsu
	 C+g/1BjIV5PcDE9JI6YLF8Jg+6bWCrqQs/S0OPro6TP09Vyf5O4RYTz3f6Tk+BPSZkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
	b=HymF8xIGGJq0MTFiC120rt99H2doM1LcWhlV9ZJh95QbEpX+WWyE+Ll74PemVoehTbCs
	 rn7X7S9ZxeW9t75Aco9C3SGN1HUCNwh9wa8Ph3Hvrlfu7sIiUJlADwVGqdBmFIJg93RH1
	 AZ8MJ42iT8Uvqg+1RQIqiSG9NJxT+HFZmjGGuRdeMWXWzFBax2BepqRpWNQ5DL0qhNvuO
	 v9+MPPFvkj9PQvfXTkPomYD6FOYJUBbTlmBYgA08h3JgRWj0rw6wzmlEElcfM7nzjrvVr
	 /NUratm2RroPQBgYEpuqafv9aJqn+hR36qoUNr38ZOyYWP8tdYzcUizrva77JRKHCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA533606A327
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 00:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA533606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so3035030c88.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704061; x=1795308861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=JecE9e1be6XXuDyJ7bsgq/w6HNy3eTpyXi1AnZBs/ei9qYWQUmrKztlbQdKX0HcKqb
         4pgIkEA8JoEfTgZWYZgcyyZQwbzGqa1gKXYfeU2pAlHETUAUohb3vCfaYlgmuSgitCgA
         RULyMt+x/Bt2iWu2zJdswd3YMeqTdKOZni+eTnFEgD42p9ze+wPrzfs8wqG6lIhd/9xC
         oBZX0inwvbqy1FyaQFAqtaAkPfp/WjqDbKQD4eZ/zlYAwLJs4UOdXYv1Wb/dtLGUdlQy
         Dz4UFFvuQ7VGcgqkpyQ24FzjW+k4VXyWNs9/Xvn9UcaUg/F9U3TUFT51OEwBoOKqAJrP
         sMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704061; x=1795308861;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=HHFEJUG8Y6venuqUE7XzhzflT6yPJkigmOheXvTqsdIlMGgNcdXsd4DGEUIWdOesDU
         CnFyjcIHDtWyJnDaCmrU2yKNZfQMryQKeqjX0Pd0/Lu+QIfIHufvspghzpzX/LYjybCb
         t35XGw+zq+ShKlDQ4Eb0GE2Q4a3ZQI46jEpamqmdrIdRKa30eQtPcLW1y7MH+v88Ka6O
         OqcntSEOfYturZmA1orBy4p8qSD3Zvuaye68+mx8EqrEQ3rG5ziDI4KilikZSnOlOiqA
         /aP9AUgica3I/SpMWN3v5A7pkgrS4xwsgO434mepDjazzZ5g612aZRpUrqScEtTYxD1/
         lY9g==
X-Forwarded-Encrypted: i=1; AL+hErHwPCn65Dx+jb3vT37BXJ8sVzf1nYQKhlYDDQ3uD86jVVz/SR5+rVVn+QbGPb/QRAze/WNs3CfFNiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mp8CnG8PIvhtB3vQwjVAEbTo15+7Du2BTIXV/zJUNYXvGdTQb
	nWLqqg9PHiYP8y9ceMgOXoeY2IlQkNoKxk7+EIg3xic6OnXEaO4QH4eg
X-Gm-Gg: AYBFou1suAxevWzZ28oq8uQMTQ1mlbR13MWQ5zlCTNprOcGvRblB5+SC8ou2oO/OsjQ
	+36DWx9rIuo74L87+sOr5l5D9JAdbQVSCgZlSkY2OG8up7XtB7ri2XV7U3Of7vTNJjV+4jrjMDH
	kmpwGnAF4etB4ncCqXkdktZ6yep05TpICdvpQSTGL1Ogd75x2yH62idE/EPwanqy59uB3q4ylTr
	9jA7IT1QkxobeNT2wCb9ew9Z5aP9MhnOxJVtSSjDy5LoGw1ovWA3G8XjNy3kU3YSsXaY+0Cf68g
	lUdqUiRC1W02k0rbO+wxb058j4uL42Skzpar4i7v570M2Y6Wm2rcotlT3yki3Ch2rDMDkUb08BG
	jvlopoQqkbAOtAZtI5MeF2gSSOnDKiJES4PZFGyv1xwqWRfDtx5jvcmjS56QdmOm6n8q98q46ay
	LFEpd63CUjODZDACH23oCL8mjD8JXbzJjzJQWKHL0gZcUERGAZ811BZefH5zo7TnyBQG0w/0L5S
	pyOes7LLUcOpYGWdeIdpafTCCiuOgFwz+RmWHMFDpx8d8J+uOBYEaLxEvtR2UPVtSgaOLUYm5Cu
	lmrenvCajxUWaenKbXZbvbKlmmULZX4SmjqKu4xIkHhaKXoC9DUAV1D1H9ivqZ98AsI=
X-Received: by 2002:a05:701b:2706:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b503120981mr6267107c88.46.1794704060898;
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29598546c88.3.2026.11.14.16.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Message-ID: <9c1a915b-dbf5-44d9-88eb-680449348dcd@gmail.com>
Date: Sun, 15 Nov 2026 09:54:15 +0900
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
> misnomer.[1] Instead of meaning that the PMU has no interrupt, it
> actually means that the PMU does support sampling. On CPU PMUs, this is
> equivalent to not having an interrupt, but for uncore PMUs like the
> rockchip-dfi PMU is, no meaningful sample data could ever be generated
> regardless of whether or not there is an interrupt, as it is not a CPU.
> 
> Since rockchip-dfi doesn't seem to make use of the interrupt the DT
> provides it with anyway, this was probably never a confusion that
> existed in this case; the capability flag was likely just forgotten.
> 
> Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
> capabilities member, so that the perf core knows about this limitation.
> 
> Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
> Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 5339616f7ca6..dd9edfd6a674 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -646,7 +646,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
>  	seqlock_init(&dfi->count_seqlock);
>  
>  	pmu->module = THIS_MODULE;
> -	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
> +	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
>  	pmu->task_ctx_nr = perf_invalid_context;
>  	pmu->attr_groups = attr_groups;
>  	pmu->event_init  = rockchip_ddr_perf_event_init;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
