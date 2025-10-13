Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DE01E9B0D
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 01:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317300; cv=none; b=ZLTaKVbDY/x+W6V97/zCiikQX8/5lAmHxPICj2KgSrnpg3S7VToSORBrkl8O/48uLuLUqSFfqzxmt2XkdC5jXDguhoGnfyqOnJRhlUski1tqAnWBYvLSphmo+LU2opQBKi8tYxFzPEtTQFFsRUymr++Sab7LR37PjEsq25/M+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317300; c=relaxed/simple;
	bh=vblrrA1PTLfQIEhi9r3mgnNvhMqCX1+5f453+YraP/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kuCCCOQbNMkuxf+WMyGRwsSBF9Bsq+fg8FcVQCpdUJsy6/b+u/56VnMDOb9fgvP/QxE0b4WD5j3zfH1v3gxDE2J5I2fmU3yF9mxk2rSNfcy0UZzSWEl5GL+ccOL/JGGu08MZoTv2hvC9c/4oU3AwBMK0yYtstTcFUz6cleMqHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yj5gAkhf; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yj5gAkhf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b67cd5d88ddso3181a12.0
        for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317298; x=1760922098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=yj5gAkhf6BBL0MNXA02+hw36MWK4tBitSyoh4BfsDTi+al+MuFeBXCdJEeAkTzMm1s
         MignmTDKUFtgYQA4KjKucC8ryLXj5MsNwh6q94RyF87l0xrWtCogYC1G0Ax4wMczW2YD
         4se0k6ekipB2gJoK+COiIUwM/JnMGwoD6aRd0XVzhUYWe4Fs2bPzEILQyQ8CW3KUIAf8
         zNAkScD0BZOn1HUV+Wu57bKOD+NMx+wIy8lAWtokhey9J+O4PuUjFngMv4tmbA2trDJv
         9fP5ZEqjeq3neRZBvXnHwXBRWiRXqVd7IhsOfsqdlAK53e8JRllgck/vXAcGR5/yOKtK
         t6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317298; x=1760922098;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=lZtOMCBjxgsM/PQvLv9Ev5J7WaQ+BhWNJmmPCQbYRnqhOdHJfV+dPgSsQcaWN6ss0M
         aTOZmnyr4hznCmRMhgIZQHnYtCdOK3fXqTcWScu3Mhlp2hJFPu+78RyhIBnXOC24oYxc
         BEGJCS36QnAi4bJqVaBs0eGE6J50UiBfrQZyYV8pQ5vI719gwUCR3l93sY5wLE768rvH
         wzjWjsXKx5cIu78a8KTcv52o/ofFtfB757qjd/veWpRxcvleCmr+Emmo6XDShhX6yhBv
         QPRLUmbAGnMPO49iXfDgvcsxinzIeEGFC5Zsv0IfuVAtsv5Z5oe3RsYw7/Dac4pqIaMj
         bHOw==
X-Forwarded-Encrypted: i=1; AJvYcCVoGXFNVRBcnBji0y6cPnRFRLMKvR4nfbjgY3opjzd2R3VJe83jwUOPAUwl9mUv7FQ+gJToBwr9d5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzhFhi1Qqk2+glu9YGI4O2f8vxMFsPY9BGxy3kh4cCUJgugoTq
	xb8TUCFXvnu+gPC2M9CZGmfoYG3koM2o7ctE9AFh8TC4YqMIuFQS1CNw2/OB+vFka3s=
X-Gm-Gg: ASbGnctMstsAXcNxHdw6oskCwjlNUBpT2ZjZcJv0wXfgikJ1z5e8RvT49duo+nTCYj6
	HB5ysOwxq46XWPsYpt+iBAnZn6/xc7rY+KQODOl5ZaJy4qYPARPOtKXmaLvnzF54srvMzKiH9Es
	Z2dcpG/kqAfJxbzRSu45JCa/yyR79m5sLFPtqKjbuERn3jzYz9yqvdxbPA/uTivPN3ijCujUeyZ
	CFLezPZ99l85IBmvHVHFfI2hA94G60ZgmOY72+ydilmcZXTFK2RxKUdlfkYhjKTnwqV7yu6OEJh
	wPG7VnJBH0VlqUgypHPJhqXPIF9ClSvA4f/xSrOoHWzT9qGyVmdQMJgtSjVcRZ3hhdhD6+lLJo9
	oFFr5f4TQJqxecRmZgs+rXcwWMcUxuiY+Jz8/yCm5V7l7nG2pXzKFvIKhnbgGTX8WB5p4css=
X-Google-Smtp-Source: AGHT+IE1B9hR89kcu5D4i0PCjI7kQyz2poCnY9xOFDtLABQiwPAkgeCMqEBV5hkmUp72wJBiyTt0Ng==
X-Received: by 2002:a05:6a00:b50:b0:793:1b79:ee5c with SMTP id d2e1a72fcca58-79387c173d0mr11494869b3a.6.1760317297843;
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-2-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125616epcas5p37346312c6a788a5398212f671d8a369d@epcas5p3.samsung.com>
 <20250925130457.3476803-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: exynosautov920: add
 mfc clock definitions
Message-Id: <176031729214.32330.12498017940011083883.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Sep 2025 18:34:55 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_MFC
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add mfc clock definitions
      https://git.kernel.org/krzk/linux/c/0b94201e327471d034d81cf5fd2131a5529eea19

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

