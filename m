Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3323DAAAB
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786871268; cv=none; b=oVLTmrk+lNbfN++3w4v/gtwA4uoawcshYy5WS6gj9iLKSDH9mwHbLs1LGECSAWr3AirJZaQzngC6Zl4EfxYP6vm02IfCh09Bps8fXSjK/fQpdtjaBkwr9nRrKd80pywn0z3aEOvHdlCeclNl+aMd9eFUgrICR3V1qypBBnzsJ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786871268; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBtuC7aoN2lCp8i2vL451vJhNsVuOFUYPUtNJXcJb1Ij1OsZ1NgwfKscxbW7hN1e/qPDlU8hR7+Cxtv3FDH5D4DE9kjGAgLW1bvwdrqC2JjvakcDVZr7lV+wejW/fj5KgJdLO0d1iNg5S/3igru+Vj7GEoClo0GyC0EQSPZmU3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG+f63Ay; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG+f63Ay"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1944860b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786871266; x=1787476066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=RG+f63AyzJ+ZwPAZrwdZSRvW9pQ4+IFzBmTyJgeQDuT5lZpQzuu8KU0Z5hRtQ7i0NS
         avO5P5LUb4jDhAGcBndWeYi8aUa/Ur0htMQv1rS89zTFPBiZ88pDwbxX6yBglL2IsbI7
         sBxlIRoseqgtdssEwfI75gk1VgLrIjTm95fgv7PYI5YJgdjbKjM1c11Twvjl3d55QYO/
         EV67xvuyJN7hEC79gD2PHUFw//KfF+uin1e45Z1sknuOEoP6/CMsHfUqkENXBuJRzxeG
         umaOox6m0xroBOLkmVogZnTPyxQbl323CAOX/AVUoEmIjvOp7HkUNPIc7iC+i89kMs1y
         QgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786871266; x=1787476066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=LcxGL18895Pz14f4v+f9R3ndoUC33KR0gzMxtQlBzqhQixfDBH3F64kQpH6cHeCDk5
         oULQxwa0Ro6a3YbiY9KMH5CYK/wr8fRLmo6FZz+JNi83YFtvX0M6LwZ5BAYi8ioKP8Lq
         bHhX9oixhtMcSbZhZPPFyQjOF8R7+Kd8HGP9A7lbZ0UoZ+sbqhqNK42C+nPzyzBRLKSy
         UpxHVO7rZDBzJBblSwW/niu5WSWXu03s3RnhkcreaPMBT1Kbmaebgdr9TMcOaeMb4PHa
         dVsXS0MPyDgkk7T/2yFgK9kdIUV8z8T1lBWSv4VUptSpkoTSeX1Dd1Xt+ty0UX35jMFr
         HMdg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2bQJ6N453X0Y4pYfCuUxFnJqIIZmeEvJ+rHpQzE6fqMWVlwEM0U40aiany14yJWcPIo4rUL9dOSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOH99XbTI1+vkHzlK+FOFN/UHEXaPuGFzevj+UoVmNQ5VNmaw
	xF85WIWUAdxWa/2zGuvSm4zT4RTT/oK6/0mnVAPuBlLdDW8sLJ8Z/h2S
X-Gm-Gg: AR+sD10vYJsmexdwCYe5QjMHq55J1CxHdcft/KYKT5JmrFx3XSZ2DrUmImXBanw+fnd
	Quh04sOUGIXda+Qde2Ycljf9M6+Ml3sD7/IfAWjFHyaJSwUxy7z0/D0GVQor0A5je6lyLIhblNk
	TJ34cdKAOEUkAQJAA+G6fVD0YoZ6ZtqrDhRUxiIg+AQS6gZqlXRQ8eQoytNBHQDq0LhYIFAh1PR
	XBfmXmqpylzK9ltk+YWDn+buDTziE21lwv3zj04HwcGIG/z5Ys5qf6c9e9unL823OuuUbp+SMwq
	9aQ/I8mh56ltfnSmAIFocJ5HUo/pOptpwcaxdDU3tIV8aQyJjRlB4jeJS8xChuUtK8RqUBMBsLH
	9az0KZB92ZT+ZgVwRT7gGueTU5obImbwD3GVEvzd++ms7gs4RhKnGkbsHmXsC27dng41YhcqJNx
	6DqAfS6n1smPCq0E3bOn4dKMfPZpASJGdbXzoWk2Ae2gtIxjEQJRTdsjoCCPL0wi29iidS8/lfw
	QOr/kUMzcP0hIS3xJ9RYKFl
X-Received: by 2002:a05:6a21:3204:b0:3c3:9a7f:7309 with SMTP id adf61e73a8af0-3cc71f19334mr19822766637.26.1786871265824;
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3218d3f398dsm26085321eec.22.2026.08.16.02.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: v2 [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 09:07:17 +0000
Message-ID: <20260816090719.892-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

