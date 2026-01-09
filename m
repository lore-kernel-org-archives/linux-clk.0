Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A21DA628
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933239; cv=none; b=UfL6JiRrVX+0jVH/ozJeNnE0Khs09b6CL3rwt+EAh13HzZOvcgrSH4eV+yjsmvn8ryyfTgZHW0Gn5TyAV7Zm6vllFr9o6gv9B5mt1CIrECANV8qiIw8zlptKqdnwEO2w3RdsAoVNVZA8HchvUVboY8mHI2ywIiDVOifohIvRXv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933239; c=relaxed/simple;
	bh=1C+PvdFiKKdhkbw8LlbPmf6zveh9bKxFcZV76Aq4dRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=at0M7Adx0/knv5pfjmEDI7Nhap7C0lzaryjCZN4MVru5ChwhpVP1K+FAu0129rK0+eFwFx8Y+4neeEG+xfdjIhqJdXdWjWSskFnIDNbox3AFBrLd+iA+9ZNCVULcXBFCRQy8Coa2RkswvW3VjzyRSxxovS74ZrF/FueQsZMCaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/xKk4Wl; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/xKk4Wl"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso2885641fac.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 20:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933236; x=1768538036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARMHINrSmnJl3ZJvnfRUQ7ECH+zDHlfb74bSrKikwAA=;
        b=i/xKk4WlvKhA8+OzOg7PmKgVg1DGnQxOfmsyBgkcGFS7s/KL6WX+/FUw/HaPQQQWtI
         xkS07T7dZtLhMPI6Cferpm/2CC/NKwEmHUiRhrDadB3bUEramtANr4PYSTLrVeS3NJsq
         Y5y/npX7gAkhebxZJv9W751ukgJEfmucsNjFcmQXKbWb9EraQ3wghzXsyNFJXxXpbY1Z
         gXPRP5SZ2RIo5cbpx0fxrB2L1jxmfuCa6sJ3luctUib9dOifUFq71QYLmx5xPiNDfwB0
         VjWFvCpRDKXQ8aUOi1Ml18zSlZjX+uESmHGhht+ohujtAlKFrOr5wSbNny4CVSm04e6x
         Xu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933236; x=1768538036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARMHINrSmnJl3ZJvnfRUQ7ECH+zDHlfb74bSrKikwAA=;
        b=arj/o380n+3BhjNSB/r0rnBd9XC7J1Y+FkbdhQZ8p2gy3T8Hd/OoxCncrGkcbZ8Wwb
         xFtXOuA35G2+QcqZ3RDiej1ikDgkXEcnpjsZRCbyT0WAaImSrc6DNEEGg0ObLzZGx0u6
         moIr0Atal8hlCkSCQ3IB63rpgOUUiXTMxRlSpd0FoXtj0y4xA4pl4K5DL34L+lQQx6il
         jCZH02clClOFgwMU4eXSHeDAXHuEFkuTzExWOjfR4+luvdnSmzCPHfNkjUTDW8gnrmMj
         J9FWahVT1Rz6PJZvtH8VKu9l5Dfyjw+jWz+vXExQt2prVCXW7qzok1vC/dKSVHKawsIe
         D8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUPt5TSCLQl5O1ipg017QdDHoIFXROhCCDQRGYYUf4unf2CiJoV9dCUeCXNf9zgRDCC7S3HEHMbiFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdWGqlq/D76PEKnwXzheSWtAep1CNpiqRQpp5foaI9No2xIsC
	z98c5rMPscfltFc2DLYtHY0QIO2XsZAE39dq0yGe9dkYDpI5dCL2a85m
X-Gm-Gg: AY/fxX6/CtV2Bz4wLJTsl9G5hC2kJU8F1oTJcmRYdfDoBT4iJwiTg40Sr6g0dgk4+ON
	FAmhiuUFKUuN+I5UxddVOQawkIvv8wLRpD8F/70fT4vNMnv1WKeEsPlYesN4P317uGQM0XNPQ8E
	DKvHm8AWYYxb6Sa7xNPfPjBOycMkrvh4CeRSW70iuhRWWGhf7NSthi5Xe/YepbZlrhclE0ZbvG6
	bMIEiVAz7oNR7aZIrfem9r0EUOAJmL4AQhNWLPUCUyhMUXL38flbkBHuBE9Gogq3DJPR7AA6haD
	E90JkcXy0n1SUq7t5jdqDEsSUoSeU2BkW0NRn1wQmYLHDVZ9IDqWQRsgEqHxz5rGMMlslwKDq4s
	KIp7RJYC5SRx6ovSulLSKXdj1zMV+YMGXG2AF+19Elc+c161Fupsg1b1bbgzxIYbGJLORsUpbar
	wp8J+IoFzEJLq8EWGIYLyAF4NK1cIF1bddLY19wt/1Kika83En9LM+gfYhjMGngyA+cwy7sT2og
	MKEUCokBbggCTCWNel00YLTnP9D
X-Google-Smtp-Source: AGHT+IGTmSXT7Jbm3w9CjpQStDKE+n6cG7IGHjVUtrf2FQ6pDXUChT4pa+dFnj0OVpaHTZmCdeK8Xw==
X-Received: by 2002:a05:6870:16ca:b0:3e7:e064:c264 with SMTP id 586e51a60fabf-3ffc0967c3amr4057156fac.12.1767933236458;
        Thu, 08 Jan 2026 20:33:56 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:33:55 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Thu,  8 Jan 2026 22:33:35 -0600
Message-ID: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
driver. This firmware is usually used to run ath11k firmware and enable
wifi with chips such as QCN5024.

When submitting v1, I learned that the firmware can also be loaded by
the trustzone firmware. Since TZ is not shipped with the kernel, it
makes sense to have the option of a native init sequence, as not all
devices come with the latest TZ firmware.

Qualcomm tries to assure us that the TZ firmware will always do the
right thing (TM), but I am not fully convinced, and believe there is
justification for a native remoteproc loader. Besides, this series
has improvements to the existing code.

Changes since v1:
 - Improve bindings following review feedback
 - disable clocks on init failures in q6v7_wcss_reset()
 - review-suggetsed readability improvements of qcom_q6v5_wcss

Alexandru Gagniuc (9):
  remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
  dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
  dt-bindings: clock: gcc-ipq9574: add wcss remoteproc clocks
  dt-bindings: remoteproc: qcom: add IPQ9574 image loader
  arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
  clk: qcom: gcc-ipq9574: add wcss remoteproc clocks
  remoteproc: qcom_q6v5_wcss: support IPQ9574
  remoteproc: qcom_q6v5_wcss: support m3 firmware
  remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404

 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 268 ++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 -----
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 101 +++++
 drivers/clk/qcom/gcc-ipq9574.c                | 378 +++++++++++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 398 ++++++++++++++----
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |  22 +
 6 files changed, 1082 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

--
2.45.1

