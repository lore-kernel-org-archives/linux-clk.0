Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86181253343
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741202114; cv=none; b=SloiAqRkRbZRc4joz9p0BIqc2hRF6ZHYsNfWk0Gq19Q5vOuzbMgQS7ebQRIE2Bm0oqL0rhzGwXhTpCz0/1S573WFRJcTD5sPYKSDSoRXBz4UJwIzGTyxtOP4da3sgbFJG2tbNL9uBtCKo41JPY6KpEhpdo2++L897jc5wrrbBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741202114; c=relaxed/simple;
	bh=eaU02QhNuP30cd+TP36D1lUK8A3cYdfrWfLHBYmeJr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GyT9zboxjUw1sBe1bB/TOSvarXO6LfmIqfcfu8FEcHS2dTa3BMlTj/3g4mIkEHe8NTRKDDha109OX4uuvXm7fRK6fk7MK2k59ksY5XMk5AXQMG7D+hSHViMgdteIU9B8DyGOcYDrxO1FHe9X92Pb3vLEQqu3l4qoefL/ibElGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFHFL6lo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFHFL6lo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso3784835e9.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741202111; x=1741806911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM1N8e/M9qgsmj8kvDT3vhaMw3S3wE2BxFSjcycLBlo=;
        b=kFHFL6lomqSYF/E3LRvEq0Mm7d2kvjJlyoVohBremTaSDYgBHHq3h4ERYG1QT+wLr5
         nNHPgntUNXTbAOjtAhTNnqNv+Ni8gxq56jXkYEUBg/mlcPxC25NVlm5bySeOs5V/7Dwn
         NyaHqKUd8HHI0HinjppPFkD31CQf/QmofqowNMoHtBoHR/QvPZr0pSk7Z4SPG8bcKP46
         4k3bnraIXGAgEXAxYNq44eIaOr1ONv+HWnZuFeOXSciFFxKcwtYXol1HDA3LmNKRgrgT
         P3OiwwFHaL35cbBEqMePahFqCnzhT8ssp0FucL9xRaNY4oRKFCVoZiYmIqi9pSv6FMpZ
         bxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741202111; x=1741806911;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM1N8e/M9qgsmj8kvDT3vhaMw3S3wE2BxFSjcycLBlo=;
        b=t4wvlF7l35qSqJGd2IAJgRDrUboC0/B7bejmGooiEDu56GZr5BXp4YjGedXyjVeqlr
         JGMO10eiTibxIbw4Yo7VKziDogTdYrGfblSKqeYmNpTU7E4hNcxDLNEenKc2DLSLvawy
         BG4ryBN8fnbNGGvjh7z3cNoWa86r1FN53x2pJBL2CzjkDeWxnzM+1q77oquxp4simcJ8
         iqwQUiYCmKbxHsrw+LvHGph2ZY0SbUwg6V2jbJ365Q7L4M/MkIVXqHN1xMTA4e3AwC3g
         iblvSPZu3qVDW0teWejz3gravNYrtl0edUUxgZCYJpJ6Zy633/FPpNHDANjOfQqfFIBt
         O8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUykvkL2u54F7nrGXPirO4offLqjIyUDwmtS4sYk5sn545dpm/YdARKTqPsGPMO9neiYNs37KSEriE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOnX6yJSeLDkzo90C6uFuxx5siywVsrTXBV/Fm9WPOvksn/2d
	Bg/fQc9pZ/20w5LFaMC/nb6XCKDurlnlyTa9LuYs9bMqZxSsVdcO/XFkRtDZMPc=
X-Gm-Gg: ASbGncuJ8kvJdKw/sAjWuxO/ooxW4h2lv8XSbBvQwlW3X/tqbHPNp5mkDp8BGKe8Cx7
	oKr5IgvzNFHJgKNcbba/2/e0YG8s2mujHEd2TaIh5Di5E7CW1atekEfER18/nS3RInZFAD3ouCZ
	Azz9r6iNH1CdUXsBW+Pl7X3y5fmeWouDXR5N9IE7MYKsE39oAbZH2f8zCbvaZh3yQnELTmFh1mo
	FucIdewuSzIM/+Mp+qo+v+U2PCj+FdTDzFFAdv8vdJYQy2X6Vcxz4dibU+nRHZBwg+R/9OMGvi+
	PaN+nDInIDJMsdIYGAb+J5zRtlmZfSjkCE/AMGj5OUZFLr4NdcoXNBjCLdZS
X-Google-Smtp-Source: AGHT+IH0QRpxP2cLe6fhf8H2SFYp0QMMo0PU6M+JQg0NUWa1IhswO3Lg7DHT3HEfhHYxigAaOb6sGQ==
X-Received: by 2002:a5d:59ac:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-3911f593b5dmr1453208f8f.0.1741202110729;
        Wed, 05 Mar 2025 11:15:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcc186de4sm29421805e9.1.2025.03.05.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:15:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varada Pavani <v.pavani@samsung.com>
Cc: gost.dev@samsung.com, stable@vger.kernel.org
In-Reply-To: <20250225131918.50925-3-v.pavani@samsung.com>
References: <20250225131918.50925-1-v.pavani@samsung.com>
 <CGME20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e@epcas5p4.samsung.com>
 <20250225131918.50925-3-v.pavani@samsung.com>
Subject: Re: (subset) [PATCH v2 2/2] clk: samsung: update PLL locktime for
 PLL142XX used on FSD platform
Message-Id: <174120210653.76378.2120670200586172536.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:15:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 25 Feb 2025 18:49:18 +0530, Varada Pavani wrote:
> Currently PLL142XX locktime is 270. As per spec, it should be 150. Hence
> update PLL142XX controller locktime to 150.
> 
> 

Applied, thanks!

[2/2] clk: samsung: update PLL locktime for PLL142XX used on FSD platform
      https://git.kernel.org/krzk/linux/c/53517a70873c7a91675f7244768aad5006cc45de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

