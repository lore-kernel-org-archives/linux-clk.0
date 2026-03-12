Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A133401A2A
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346031; cv=none; b=ky6P6Cs+1Uo1mehPd3cyOjzkioJNkXjqmOw2K74EKgrLJkZCejCq+oL623TlLw+WUOolVuNwzsmb4Z1eMy0Dg73oQcX7bGOIAW6HlMtnqQQdIhOj0znu0MSEy6rYSPRYq/3F0smYCoCeq6IPn45ojaNwrEcTbnXfuSasiH5ToAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346031; c=relaxed/simple;
	bh=tkQxE/WaHOTyLw9z/sp813AJR6zA4pd2NdpV7fP6+0M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Y7R3lOZlNaLsjsRynuFwyEfWfDthN5QfsZUSPFB1/qUD+b6s0SaBMfN1gM5DsWL7qy8BDtC2r9JQnURxxR6omSa6PeRkAzAv5lJCDwHg9OLgNTy281fHvL2kY+sx+CDp1+2XtbZgiOARRHy7Kd6V99kAMFooeL3PF6czj17hpIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hkLUX7Ae; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hkLUX7Ae"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40438e0cba6so975268fac.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346029; x=1773950829; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=hkLUX7AezApsn2UftlxCJ8GJ/vrCumzYXlseIeyLMluuINpCxDzs/Ae7ugqMbIeoKj
         1nV5oXdDSpWXjLTvht+TRjhEfYBJF9luuw5agujzRoLdCK0QWQJlMJ23rB4AuXWsrMSf
         ZVEO7KxxLrdwK0isqrQHjDA8cGDM2CARAuusAco8/1bErafCg86zlOZVjbJnKvZdyetB
         75GiscdohhYZ8q+sT/wO1DUpdnMXzqxmdG9He93qeC5KRomW/d+9m4ahhDp1Op7WDV0Y
         pyJsmT3TtTBOSfSdSYOsSL8KHAF8oI/eWrPveWjg2QgibaeW5YWu5/FfgalOZ3omS2TW
         k4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346029; x=1773950829;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=srTzUT/MvHEbnSm84rzinPtaxfvXlgqJhKMH751ZI2hZ11QBqxsQtaUOlQCpX+FBRu
         69JTB6R9wBpgSvRCDG1oXJzMTxpj4REMaggL4kT6qG3IYcjwA2VFXNVagnM9virVggSF
         wJP7+gHZ0CPWpydnY9qdRRRFU+e9nZntQ4gYneF249+ycGmLq85ZH6wucImSTXxDt5a6
         RqwaKoe1nb+y29wyX42sbnHuRBgLIBMQYUihp26QYivsZwj+nshZh/mQq+1jgLeYqrq0
         9pidkYkFYs2hf3n+jt8fJSusdzoey+T89LASlUCwqG3a169I43BQCHoLW1odbF1vbUqO
         Li1g==
X-Forwarded-Encrypted: i=1; AJvYcCWMzUKi/zl/AAY8/xpL4h99GCKzz3DRm4IaXch+zQ2yD124KN53DtljkEeKu0QtisnHsdkHrtL6yL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+EsDF6i9tG0+drU/pf8ESgx19isYa6HDiMVaQedU7+R+3vrR
	Ju7uL6hxKJmrCGMTExwBhpwZbQ63ZxQjH/VJsJDZaneg8bb5YFv8CeqVL65Ayo9LIIw=
X-Gm-Gg: ATEYQzyAg2jcmODzmrNhSum5vtqKpoGKxM2A1VMtm1ymdDDqdyXNOmoqETx5AhTn7c4
	hgTgshGuRN1CaoxaUpC5CchzQCwaEKF5UBBj0F/FtQqprW1EU2eHGRUKTi3uGnf7Pwii1sKCyCD
	bz9/lkoFDT+03bIhu1lz5A/4zj81pRUZ93BkieYTmn4QbjftWMzf93x7hlfzzuj9VGqJia894hn
	007RxOmrm9bHxCsB5UG03IRD9GyIlb1d7kWSVQxmc2wKVHC0+3M7rdmKNZOAmnJhKrqD39I2HDv
	hUu3bcVk6AraMdudnbapX/VSYFoXDIwysPlrtToMUt/RewG11XEO4WitJpJIfmA3l3cjFZ8XgxT
	BlcyUAHxnK7L1G8mEIKTj0alugjMiz5POe/kJB2tN2b35YXI4pUxprB+eI8OZ/1Jv37axVM9uI/
	ByfbDFYhQWtq1TuxaRooWl7Ldzhx8wzkiqVYwI51M=
X-Received: by 2002:a05:6871:5292:b0:417:482c:5c0e with SMTP id 586e51a60fabf-417b93fd827mr366324fac.43.1773346029164;
        Thu, 12 Mar 2026 13:07:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
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
In-Reply-To: <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.9130759829438828661@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=520; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tkQxE/WaHOTyLw9z/sp813AJR6zA4pd2NdpV7fP6+0M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzWwLcwCiJ8Z4K49ki7iVfChNgBVHE7qCgpm
 Y/2/Iw4lzGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc1gAKCRDCzCAB/wGP
 wC7SB/0fcJl+IqsMtJ0KbpayFuuIWaEoKx2Y+kspgWFvDk3ZZN5eiVoAGyzSde4TNg8/MKEDTzR
 zssxuG27VwnhdKRK5hXY3KyVuHfvUo+Q+l1vWWM6d47IkLLuJIESKy+aV6ajhGZD5ExQkBpqLUf
 /vCSyDwGMkE9rkFHUQ9p6WuFUFifDb0HOWvcvuM9MQ36kTfp9Ub0ufAYs4MbrMujowXIBE5YR5K
 5KfOPmbBOw6gtvbrhPFp8Jcwft/caJjstn4wz3XNF9+w6So2N7A2xaO+U+M3NrKjgHLBAscD6wX
 SU78NqGacCN8wXbg9BmNJJebWwHSdHSmXbCCXImCwsfnHKTq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

On Mon, 09 Mar 2026 20:04:43 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
> 

...

> +#define CLK_TOP_DRAMULP_CK_EN				205

This one does not appear to be referenced anywhere.

Should it be added to `static const struct mtk_gate top_clks[]`?

-- 
David Lechner <dlechner@baylibre.com>
