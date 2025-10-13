Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9494C97
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317288; cv=none; b=rtNDHdpwureaoxhbnfovT4umFzEmx4HyZC6IeJZbKQTVn0jhcw+9q2BYwNzwk10j/706Pyev9HKPlT7CuPVgbdwi650AzfM1BZB5GwHKnTBi4KMSOMb2mNIjnT5hIkAsD8eOL3vfR9xIkLyl1JRbguP5ptl8UQfDpC4RINcCoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317288; c=relaxed/simple;
	bh=hCmW5zBZE9uimTQ5vZvzqHkQrWXaCfMbVKZK0Y379fU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NzKCSFnNOa4ubVjTPMNKBtMmgV69fAMNl/ERfaq2ox0E7j40+xvowzpYuXUvXK7kVco7podw9mychMHBQ9d0jnTEX3npHHX8OBcodzCLQv2VXv/CslevjImJcaTnEfoz75ZYkwenoloLlzVoBp5ex9sV+7oTduYB5PSWOa0k4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5PlrC22; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5PlrC22"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7811d363caaso224794b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 18:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317286; x=1760922086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=Q5PlrC22f2GNThM1tOGYpC17lHt7rz1g87ia4BGWQ4cM7u9y0YJJN83Bgwqq0t8VhC
         eZBHEFu2IPTYUWzvYHaU/pTcXYTmgmjk0TnPoJ41brih2ybDjyBpVSqVniEEKbnmT1ge
         m7igMIfr1Xz0Y/Yczw8OP+C/LggxpSesv5D1b/Cbu0fnfuh+JUVzAhG+oPiw6nJJASt8
         bdNOiXWwEuOYyDx2i9EsgS2KM+tbY5AVHc+IELBUFVSmnUTfUob6i4W2HRa7j8S+mo6U
         26QK4/4Qdf+EXhqYJQfzMcaqljCKwhLu/JcmWDaCubJGcjnwdfbMFaZ6xFk28By4n2UF
         kfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317286; x=1760922086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=jBhNExLLrUrNUgzowPAKrFq31TUiJhVKhZJGGw1aCLppGkrO2vixVoGMHO5SXASMRG
         FWP174YNN9epYh5wYAi0tlD1aiOF7h7k20OvdMzdJeu1v0UG1zHg7TMq1wlY69tSEtM/
         4VNUtEVk865hN68xTgIcDcMy7CJIqkARHKBORlchxz404uzB3BOnFFMSD33OCJLt4gzu
         yxHeIbVOO/6Gq5sw6azBhrp+xt8zQLgyDNA0bRioeo9Q3roYFU3JqQTQbm1pxSTc87+P
         bNWkY9etuD7lZiZtZQr6lPprMJl8ygkh9qTyMikCCd7dbueU4WmGEdqmjj8zJnmJtAbp
         Vg5A==
X-Forwarded-Encrypted: i=1; AJvYcCU2IUeSBlrBn9i6Zp0UpjZtaQuQuW3gn5yUQD7rls1DVpw/mPiR5YV5XW0RecZ6u04aBr+1oWGx9Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtJMeqyxZ9uJl58JdE2whqt6mKaq0pVqrLNuo2BaejzR8AqGf
	kZSY3muz78NaJe9Ohe0dxZjFYG/5VWt+V247lsOm+Sor5r895daOCdjt0RuDkdrX83t/3STDT8r
	YXVsfcFo=
X-Gm-Gg: ASbGncvg7Q9ZnDcgioYcW0m9nqPujPvkmQoZQUErvQoTiSZH6o87ESQCf1ALMtP0vyI
	akmcl70h7KMRJs6XxViqenG6KNWJssXz3trjCqU6BLrQutUI9i0DrmjOjdvdFm09LtUg78qP3M9
	BBgFUCISSKt8CzeiQ5jQUoXrmaRaTK8I09uJD78stVI41c+WLQS0n39c8ElAnoCB7rS/ApwRiRD
	cPFqjB9q/TGK0SR/Ybx96G+5BI3l8PRCTbArV9O8Dlgv6HLfGRSbM6K9hrDUY9Snz3Jmxc4MFbB
	gdVVfe56WTbK8JqEnCuc/Jud3w3Kmxr/M3+XDv/upO3G3hSnlF+hoi8IP85WZ15WIDjs2Daj/pG
	MpzJ6Kf4CZ4p4+/aL1lP+iSrJ2MBT55h7ICDCt+PKb/0PuXoRzb1lT02t00B2
X-Google-Smtp-Source: AGHT+IH4f79PGF3pwTJWa+RZTaKvtY1wF99tutuYa9r5c4lDGKIA1fkdUmCffSl7ZEfXNQxSTp20Eg==
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-79387a281famr10486681b3a.6.1760317286563;
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add
 power-domains
Message-Id: <176031728187.32330.16757640384726154867.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Tue, 07 Oct 2025 17:03:10 +0100, André Draszik wrote:
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: google,gs101-clock: add power-domains
      https://git.kernel.org/krzk/linux/c/8c644749ab6e42f51fce82e3325f58ffb70f87b3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

