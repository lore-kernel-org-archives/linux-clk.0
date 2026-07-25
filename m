Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF1212542
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983634; cv=pass; b=bB50wrAaHjoWuu1IFNPW/3S/hpoALMe0zIi7RJuU9d8BmGB24mlJHBidRCq2prnc1orfSPNmKNXRL/QZvKAKk+5MVui2nYJb41HBknVgdp8JJcLfr2s08fWjV/MvAxSSZ5P6fMNAgfRdVrPlGjOwgRE0dsnMEUuy/BNKDFlyo6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983634; c=relaxed/simple;
	bh=nbfEHiFg3ujAMDl8T5Sowr96/ZasmMbVmzrGHikYY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+6kLtOk8oAW+bqbrAghTcv4X3hsGW3Ir93DidnDE81SX/e+UYvfCH4saRfz9VSuTbr2H9QUEktPcerbzsVmBsCbU4M09PNFkC2+Q5J/oiNTMHtbQRaMOGsejQXmlomHZ3yfVuTojTH8PJONpcCPOaR3K5CmtVbNUNhgzBCWxG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hzTnJ1kZ; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hzTnJ1kZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so19989095ad.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983632; cv=none;
        d=google.com; s=arc-20260327;
        b=V7DLecsxlbQ03CAk1Ulunfj4vG0SnXvyShPVAxha6JhX6QiJtjn7rFTLc28Ps8YeqH
         gaD/OZr/Cuyi4pahM/eTqcZLO6ehgEImDfZUQiVnzY78szOz/WPh/nKTfZm4LtGA8jWD
         Bo9Q5aT/93nBl0hzW/jA/OeBmtKFGQWfHX6yNk/eltlpV+ec7S2DEwKl3pNvRu66s61b
         vzcsMwohPjVPZ4//ojjyoPaEsfmTud9psfaVwPxly7vH5pRwsT3dTBi+tH8fHMjzjSzr
         Xr8MYuZudWS2L0l40M6AtaHu2W/bZKNg0aOjoQTkdsYocq7fvKUZfSLo+0BBsOO4sQhw
         F8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        fh=uWpfZjHK+iREUJ60JL5Pn+t+GwlHnOYqBiP7Zfve7oo=;
        b=saAgzCbVdRo0+j55NNYaEy5OB836o5TDstqFXFgEC+3uBcslI6unon0Gmpnyo1qbiV
         bk5uPOeDo9fEjLvAUOFGlmq17R978FHSPubxjx40GGlYrM3mAuNuwkZuQl4rAHCegmtV
         +KrBx/zsOq61CecNxfT0RkSMxIre/Xmmbew3FAmM1v0gSK4BNMEIkArvsAFscNBQ4e0M
         WcVtr/CB8X7day9GnXGIgsmE2NGEo+78/hE82eOZTvPpv2MWqpSLFlkQY0GOp8Z5f01/
         TuYkFziOFx6b0ZsjUGzs8HRQ+uf7UD1VuqwkUUaal+y82E/Hlnctl56gQk8+b8541P2F
         oH1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983632; x=1785588432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=hzTnJ1kZ8VTPX2spDgxKSesmfIj1g9m2IqHc8k+xpgUndOW6+Jz0Knq6axDOrDSES0
         QyWZtsKv1WXuOS5NsC/qsqVOud+XECSiynAMq8yDBGnwOG364hXikPmLhcIVxbMuU+b9
         cksvPr90Bwm2pExw1Xbz2yowaCUyCF/tOS80s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983632; x=1785588432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=dEMXdVPrdfN2/f+XrO+03dOsqZwcVhq27H/urnRI/ry0H8SXyoWzMjT/W4MOwuVyRa
         b6ZT9bxhD9uIpu/moG2DJ7/tRVJ67nCikTUO3DUTm/bkOkOfqXrcjTa+NnYXfe7yzOvS
         vBrVTvVej9N1tivcaE05is6wJARFZ3x+X7wh+IVGF8tRe1Dlj1KafroILPxhQ8w23AJK
         I4VA41Cuekl2VhpN2Qm8gGu7tbii3gZssI6bK5w/O0MftvGsk4l8mpo2kbkKPi1NI/Jo
         aLnZy5ZQUz0ae1JvB9lMRhx0+LYqJmfSjqTnNmXxWrV74ib4FT7TEVUNOf6AOZcsAVl2
         OqDw==
X-Forwarded-Encrypted: i=1; AHgh+Rqnp20ZB4tRwM4L27bl5hQ8aw1XS6dKM+iw1P4EQ4Vhd/gBC+OTFPzZg/GJjXXX3yN0gI+QwjVws+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXZiUtbHiEJ3OFPAWGpZP/h/ch5i727D3XHLNpsivmFTYFzuN
	qKsYFgFLW0AHBb9w5mDFT6p9TdPagMbCj3kpfOAv4/AitQjjTXfjYawN/qWvbVpUOJVqZajENdx
	vq4y9U62dzv9II/LJtVh19x3jhUEfl1aSAv2VMGk3Eg==
X-Gm-Gg: AR+sD13sHk2HepDQXxJ0pW9ZsRWcXY7MaKCFMKIQ8+pFm6s2Pr8tX6OHT6lo8RvdfcG
	FYe2fTo5Ab/lHKXoRTJtUi4+B0cP6AN0BanMnewmPR3K2+9wzHflgeBfkztYLZ2a23dFIebgajR
	8p8nD6cgFMlri4YPiUufYBuFY4H0Mkem4UVuJdg4goSUpq4bOdvo4TnNPcXdxP7ThRkavA8TxsS
	42tO4v+zkOC4RgQ13bpMR/GaynC7tkaEgTJ5yfWJEfohKtEQqhLMHZmWggnFihIeCgiDIcEIr8f
	BDHkGFu1+2C98yaVrpEwT/LjTve4fy09vIbqXbNuJxEi0/ryHT/puHPqt94k8LahJPfSxM03rpG
	WXm0Rp20t9iz4RKbc5P26o1OnwlCMzs6cg6lidjF20QusZ/eTsu5vC4Q2HsVw7wEk0ReCiOIiOV
	4fBNfxnz7MDU4nFqCqZHNIOW86/475SEM4HQ1vTRnREGhfwgVNDCA512aVkoYIuYiTBufDeg==
X-Received: by 2002:a17:903:26cf:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cfde895b4bmr22242195ad.44.1784983632412; Sat, 25 Jul 2026
 05:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:47:00 +0800
X-Gm-Features: AUfX_mwTJNR7-hRaq1ZTUYAiX7Ud5gZGyBy8PdA42w9wDa17cNUs0zXUmHoUAFI
Message-ID: <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v12:
> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
>   Neil, Vlad, Bryan
> - Drops dependency on passing polarities and positions. Moved into CSIPHY
>   port as agreed. Neil, Vlad, Bryan
> - Omitted mux to CSID as discussed this will be done when splitting CSID
>   out as its own individual node. Neil, Bryan
> - Updated Reviewed-by: - Loic
> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
[...]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Works for me on 7.2.0-rc4 with 'qcam'.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Thanks and fine work!
  Dan
-- 
Daniel J Blueman
