Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AF402B8D
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346035; cv=none; b=PeiJpFDfDHTAckyfal62wLlWdwgxtSnzI8JLcXtXqFodTgyFNrnSmfRe95EPLekE/szp9LxJP/zqh0W/KY8IDyeJSXny2q6Tunyrvbw77SsnZPiM+vLaQjc1Adt8IifPoBQfIeLwUOvKWeVxPT97EGhmvDOdeaaUxgNZtQVuy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346035; c=relaxed/simple;
	bh=CMNpkQG0OX1ZmIY4eNoRhc5pN1fKRttQ1DPPmQGZ5Ok=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RvbKvORYRSoGYwXzBS3/D/kLA/c/rYnYu6vumdfd5i35EnDYK8B0vMi5qw2iHYmgvDkzKR+5xtKBqGmiuzzSK7F1oiwrq9G8cOfKeOwj8o2Lfl7nVMpkgWnlB2XMZBpmvmVwBGbrixCD+CSiaq97yfJVIUqf5a3GCc3vKD/A0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mAm7PGQu; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mAm7PGQu"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-464bba3a9easo1030943b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346032; x=1773950832; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=mAm7PGQu766QLdcOkMPI+qUB5mZZPzXals0SwH6kB2P+4sWPgb87QZPSYPCL11TtpI
         AX+rgqNIK1TeOHSn30zOXJNgxv7H6LXbfhriQjSY7sjIKP/beCMLNEOEPeYh1Vj6YLqG
         Nu/X7Bwf2kOCIE4tslvrqPNVSSnpuR6dJgstefLiAihaLia32PeBJK0dhMbg85k9UxwR
         ZxWYe5yLniCfvazFw3scVVby8X+aIJ3Gxof3H3eExroFRWiaSrYtaZ9hdmYXYEXrCJRB
         /Pl+BeXF97DSlmpqrfgaAhIGgYWUjN/xWBkDSQ7I/LdNQubEovFcFEc2uZ96fp7VaXKs
         oqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346032; x=1773950832;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=Sr8D3WDB0uGxrkCK/Yv2Nql6q05nVIRuv7qM+yMa4ASSvqOnaC/Kxtc6HDo5ogDSBa
         VfOqdDFYKD80NTGsxPjdRFAn/llolqKq+Zx9nC2xzObxFqlL2HPRtfSJBLzFrfNBYYLk
         mrWy3Nk0Bl4QQMZh1MdGY0YBOuN/Ypx3sUNJAeP+vTtQ7rL03OZNjzUy189mc14QujFG
         RE1uGK256qq2nZLIeoYq/w3KKcO4HexAEsX8emUOcCcAumDDCniZBManMKa39zqQOnwF
         zFLvl5yHoevmvR5vXWHwYOZiLnwydlW5HCpaKhUZMxB+KkyXE2NfMkYMMHzRjKPW+Qfx
         n1CA==
X-Forwarded-Encrypted: i=1; AJvYcCVWFm0iw0bssVDGNwUsBMCZQWDgAoC5dRGVsz90tKLtgzyAUsHmkU2Fi4B02uKr6x7YvJ1NFTKJq9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVO0Jejh3yOeVnlp8MUNCg7GUgPBw+BKxV/5jyVdagk2c//cQ
	84sxa0KxAtgzV3Yvmv060dOtBoNO/BLuuLFX05X6jBOGe39Tphjoe+S+VxxKJ+dC+M8=
X-Gm-Gg: ATEYQzyIU98lgJIyaYSuvukX9irglNOsDEjTAbdKuBokqZWzMwemRsLheXvw2NvtiCH
	Ngzlk8Ea2YVkpCdOtaAMSaaq1keCRTJAsTqrGWWCysyLCeFesoF5qrylYKbWQQTM3uWBshxJIHw
	B0J6IVbLs8A8yu5OwMQDqCdomty95NYMeYNhJPJam48FF80tr1MWD+b6eDWUYy1A62NV6NQceqQ
	jHOmdgVKvcbkXEGGrGBf+MtTFM6aMWspHy7UFWfvlel1ewNzBiKvoHCIVVXLYnSf3o33BhDKfAe
	vP/wO/ae4LMriCtWYV21WB38v9OyFsx63laY3CkraxawHsCrnou5Sov9d+bS7WElKXrY2CmonuY
	xfeIfZO9kwYCrWK7zrmc2a2CHB23YZjfQuBKr1lwgb9m79wmu6ZDTb4RK1EW0RwzUePP+ZY7Hm/
	VRSSVhA//cg30XqFxWpiRS/G1kZVet3xzjeomOxU0=
X-Received: by 2002:a05:6808:86a4:b0:467:2584:873f with SMTP id 5614622812f47-467575432eamr241621b6e.40.1773346032433;
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 15/18] clk: mediatek: Add MT8189 dispsys clock
 support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.12067751220383417571@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CMNpkQG0OX1ZmIY4eNoRhc5pN1fKRttQ1DPPmQGZ5Ok=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzklpGpUf/ZQQIyqz1DGbRxkAj3JX3gj9Fst
 kHYKcWEcLiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc5AAKCRDCzCAB/wGP
 wAB9B/0amsj5mtHGl7JwYJ4m/8bCDd5vMrY9EYIYFmV67HC/3VsGnfj1wPsBIVVvEBbRl+IhIIA
 ZsVi+f/fEjvU6prplQZ/YZd8np1yTT1IWdeKgbGDDKpmhj+ay9gbv30oTZ7hntcUeH8jUMJrP/q
 tZU8uftAxgDKfME+lIWGswpoBwlUSOzobxeouycG+WNAHOkJA6P9MGeEtvRIK+FKpHbvhe8km04
 Ox8e94DXUVshX9UMS9lDnF5G0nMYaWHn1RibGjXUQ/s0dnAAbbdC5p20fdx+NRF7/D6TTyYAO4N
 AauC6vpKcGuJ+POQeLop+wx9WdMiq97CgGUQthHxIRLRvwFx
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

On Mon, 09 Mar 2026 20:04:57 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add support for the MT8189 dispsys clock controller,
> which provides clock gate control for display system.
> 

...

> +	GATE_MM0(CLK_MMSYS_0_DISP_DVO, "mmsys_0_disp_dvo", "disp0_sel", 20),
> +	GATE_MM0(CLK_MMSYS_0_DISP_DSI0, "mmsys_0_CLK0", "disp0_sel", 21),

Why the random CAPS here? Seems like the name should be "mmsys_0_disp_dsi0"
instead of "mmsys_0_CLK0".

> +	/* MM1 */
> +	GATE_MM1(CLK_MMSYS_1_DISP_DSI0, "mmsys_1_CLK0", "dsi_occ_sel", 0),

Similar case here.

-- 
David Lechner <dlechner@baylibre.com>
