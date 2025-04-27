Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B521FDA9E
	for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781925; cv=none; b=NOKNWuY4lyymgYQZl/saTnNZWVMInIgDPXLoi01OUcoxTIiYEHxl1VPx9Jhd6E6+xOBm2RKJJR30RtibnwPHJbnjrYembknWkpTV28rgw5TWSbhGu+CMdghnA3SEB5MyyYeFwqKyDegQIINj57gF8Dt/aodZrgig5WzlxDJndmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781925; c=relaxed/simple;
	bh=Sg2uIs9CLRdDP1c/mamJmns3Se/NeLRnkCgerXSQj+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vFNfjDdHEwKeOiLxA8lGZQ7ovRdNmwGviyH4b2jjhSdDni9kRBj47Rid1JwHhsLJA1qE2TD+SMcE7jZNGjRnybt4pDsgHeXAvZY6vViXjU6oYvP4hnr443jnMlOhUEXX1rkJ9J3PnQix9GUvw3O8JGdgZaXfi3u2gezB573QCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QfMwSZbw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QfMwSZbw"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so572418a12.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781922; x=1746386722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNcCWpWkCjlURmIOiT/Xyzz/qjRhgBURVuEZyl4hvPc=;
        b=QfMwSZbwkfRntcehMEV3aM8+Scg8X4qKPHHO7+B/eHCrg++4x30eqsDYgrVW+UBn2o
         U+tR0hhjoXUd8D7CFCfTb+HSoysOh8hDfkCsYbhSXddW5Ovumby3Z/A7ACmp3MROVVmk
         zIrvkasTFWvlK6GHsSCOm+vTrHi4jbgHdFdLYyKaiMhbXbQ7Mj8Xz6RVJSFx6/s+EXa3
         LZz9LbYKTT+uasLppC2cihjWG8rgM3/VfCjHghWGxLVvbIOb0c30iTmkT2S48WsGauKL
         GO2YMA3EhSYmZ3FjYxGe4HEFRkPaDsh5gQ8s6Kue6DEM7d9Td54g2BiC91PlEsx5JOmZ
         4j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781922; x=1746386722;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNcCWpWkCjlURmIOiT/Xyzz/qjRhgBURVuEZyl4hvPc=;
        b=OSXf4xCvVotKqDNQgaGFLgJuZqWFWKoo9IwkOs4mDoDNG/+MHPbWvzdSZLQ2gCThBl
         nojpMNEmMMBcq5NltSkNYZ+0AUjLMBeVc82k9hEWVcSefU8htolI01VTyDS7qhVgezJL
         g3PkBIA6JZfaUNv+ELyjpYSW5jiKNVzv3aiEdB60r620CQDDVTYDyIrYH/1pxwZt6y6C
         HbmBjdhKDGaN8jIz36rk0PumDOIs/4889uu/89BLxGAV6qqHwS/21NcE8TR9+4yFDf9S
         TFaroiCjau4zShfElrWw/8WYYgad18TSaetONhAGCcc+XGmgQ59gOWfegdeN8jAKgUK4
         cJnA==
X-Forwarded-Encrypted: i=1; AJvYcCUD6dzHQfAkwgb3fvMtmRJZe0lYJSBF3YBnfAOprgokZ6q4kgFz5zBbOJC+bEkaibXM9zn7cP3WtOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBCSyZg8/NQK/XiRmD9Qn5GCrvTuZOfRYem+u4tzHEHkyAtUE
	XwN4Y7ZA/YXKszp8SRZC5yt1R3F2zQA79gv4n9TXYlMBw9kY350JbcaYHzuvXlaItjiXDDYySQk
	z
X-Gm-Gg: ASbGncsF26CqvqTqReBaVW87wMTY8/NVUBQHnh09mFyitmv1yVHK1GT24OHuJxZqoWm
	5DdTI0IY9HCWjeKsT1pv4ECKcR70gPOUqKnI09o8JOCii/HqGOKurRKmB97EeDmJlj5c3QzCcBa
	z7aYQ0dtle/QjHZI9onw0dPGPo7kkq9/9n+MuwhebzEp07quFRSMF32BcNp85RheNHJHW9QC5hf
	d1SUE0q+UzyruNdqDxOmYzbpDRr9yLJLdhrQl5rjjnYDKrnBuKk2RQNB3tMFpD0C7sW5KivETqy
	tTIQ+zvZqPBw3bL/sb9S3UVNRX0KCvOfU0SaAFyvQBDtBCDAnzfPRv9Gido=
X-Google-Smtp-Source: AGHT+IHbfxdly2O1fFQ/MEQQRx0A3uENOeLc1JJa8cSN//BYdEU12hN+C6YPmm2uTekVvJeuxnfO7w==
X-Received: by 2002:a05:6402:2353:b0:5e0:a4ae:d486 with SMTP id 4fb4d7f45d1cf-5f72352ae9cmr2474742a12.7.1745781921729;
        Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423044153.1288077-4-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97@epcas2p4.samsung.com>
 <20250423044153.1288077-4-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov920: add cpucl0
 clock DT nodes
Message-Id: <174578192026.47282.1370567375954176035.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 23 Apr 2025 13:41:53 +0900, Shin Son wrote:
> Add cmu_cpucl0 clocks for switch, cluster, and dbg domains respectively.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      https://git.kernel.org/krzk/linux/c/2a4067c89e4137c477ca6f367e65ace0f2132922

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

