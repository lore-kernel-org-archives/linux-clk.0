Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25F402439
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346031; cv=none; b=f+PbQwTLi+GU1CkGl44YhKBV0erh2tV6xiE1DIFmbfoQ2twt+tfzOzXMVQRoC26e9Yj+8YHq1rzkcXAsMvEx/tUq/26w1YdjaojUsg3qVgjUbFXBKAobG1FL0iLmhSqcTEhHfQ2H+iIxXTQGYcV7vBYUr+b7wZEVCpK6SLqABs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346031; c=relaxed/simple;
	bh=lKJ2mS8qshYtbORsyK0ngNUDnpsbzs9HMnnIPPn7MQw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YyTWJFUf6G4Qd9DqbL7ykrwTseoBM111y67DXjtPoDlEaKJO5uijivkpNOnYVslWjQi9MR2itQKggesmOvjNgAdrjavXN28FrO2pwEROOz7Emo21dl+rEKeXkecYV2kwlRA9G5FuW3SMq4nnfHNypZOYbzEfpggy7OeuTpsVFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MbG9nDAJ; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MbG9nDAJ"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40ef10ec84cso1017050fac.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346028; x=1773950828; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=MbG9nDAJG8oXVSVU8t/6DSIZFv7mTU2fUcI5uV5nA9/sa7PdWx7kcMNZDg1kPYzS6e
         1NWXFt74kSIqAU1QrJ/C7q2k+ZPTioNZHDXu4XYborZ/1HK17MKWCJjnKm+oQ2DtAHL8
         swpCIQEM2o8hOD3u9K7jWdIvHEZVVvwXw7KdsDjqLERZFiZKXGX2pu2IQP4V0RxbHghh
         S2cI6nb8clmayty3SLl4XZflwpd3YjiUC4fvn3giwjua4pDYAtjH0RpK8aaSMp5vGXVL
         dGYTKYzofzEpthE3kXGR1FnIG1EmLRNqYgax7mtvM1x7Q8+gpJOsn9DTJq93ESUmy7ZA
         lI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346028; x=1773950828;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=Y6qpFrvThRdHXeXJAqPw1rIJQi/UPXlZnQVJd0dPbBxSEzjfV2KLeac0HmWBPellda
         uHmN0GiatBrZ2yvZlo7seihWw1W+lKH8UZzuXLbXYMfFm7BnGNFOOXl8tt3HO6kEXrCJ
         pyS29ZJlYaz9LCh5rFq2e41ZxvYyqzq5iQvh8z7/qbFzQtUp//YTvfa5ygCBPut/iFf3
         hh5+JKWKMq/Zg9nchx+1pVbp9B/Fjzu9bStQzNCZphEVmyajv6CoggeTKIC7t4jxPguj
         MMU++RTs7AGpr/0iI3h4L4eleKfLenCMFaH78OIBk7UYJntripi1M00WxsTKmBTBKvGG
         2Ing==
X-Forwarded-Encrypted: i=1; AJvYcCXQgN/+oArgzdX5YqRK78trIR6+rYBysABw8t3osq+n7NitSYtFEDOoHpoEY5fh40tHdM2uU93+fU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4LqY3N1kt5BX0F/tRAWUoSIM4r153Oud7XUJb13ExnxYW7TZ
	zg0MVBzUZfr4CxyYL2cUUfouCf4sR/pdxI2anPqQxFdwJP4AKw+lMH42pj8lNR7G1QE=
X-Gm-Gg: ATEYQzzpSx+k+09cmgK4m+3Z8sghgn1e36qGaF4sU8C8Zv+sU8q4XsE1xHxxq0oLZTh
	rEzrHue2D7BwImC2BsUJ10xJCXZNl2Z2A09NxoKN6UNo69K4gMJtbFbQMMNXkGYb/y1WVD8O57o
	qo+cNnDKBmFFXh58b35Zpw6ubv7WPJDm8FcRvna0cL7LrdCdynExzgC4oKsG1+P1Jfa5/G6szVU
	g4k3tkPsTtAz406PdooT551hHk0QHa9QxtOhNfpXC8/6vABqM6BTZ1eshATA9MdiHlJCwHRWnO/
	Vp82+EFj2Sh95348psbL2GHoL/z0PYNG3/v0bz/5QE6xofA/g6lE0EVLcM6s64najRhX1SXWYKp
	08W5P2jeBAFVnjT0SccSe4Ay8QNKhh/Sb3J+w4DbdOHqxV4N1qGv0yQc93ofAssz9qZ5hT4v1iw
	gNSa2Qpc7F07cZHYdOQUWRBR0yzfY5
X-Received: by 2002:a05:6871:3864:b0:409:7a01:6e2f with SMTP id 586e51a60fabf-417b906d7e5mr406126fac.11.1773346028068;
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/18] Add support for MT8189 clock controller
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
In-Reply-To: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.2284323207748123029@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=515; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lKJ2mS8qshYtbORsyK0ngNUDnpsbzs9HMnnIPPn7MQw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzPi+0zWeulMgYec/oNHyb8sbOm7PTreogHt
 ekbB22puQqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMczwAKCRDCzCAB/wGP
 wDfIB/91n7afDNKVMM1YVnaRi8vpX9xoS/2fQLT+wzZC/3m9wr58g42+Hy7F1+SywRjBf8f8CWn
 BlwpL0zR+GBEnDlPiWeCojMa/oNotD6CWbl2gXYC33sllryI2rkGy18PxfunAxpNBAm06vWz6Lr
 YvsvuBJ7kEUcqf8+DH+bgCKLL/2fWxaI6Cpj/rggJGywF1rJMvK/5qwFPiuIUVDAV3xRL09Firz
 uDocVTpeY9TqTi2Nq1MU2MfD+UH2EKd/SzRjDlgDoyOmTefufsLWnJCeARld89Zvg/NIOTGWdkC
 WVTaGeyWsXb+6V8GO7rcJ8/3R5W+W5sdRGFjjE3ewiwYd1Gd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

On Mon, 09 Mar 2026 20:04:42 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Changes since v6:

So this should have been [PATCH v7]?

> - vowpll/aud_adc_ext are fixed clocks in dts, remove from bindings.
> - Remove unused clocks (clk_vlp_sej_13m, clk_vlp_sej_26m)
> - Fix confused naming: vlpcfg and vlpcfg-ao
> - Correct naming in vlp-clk driver: vlp_fmipi_csi_up26m, vlp_pwrap_ulposc_sel
>

-- 
David Lechner <dlechner@baylibre.com>
