Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F49427AC44
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537027; cv=none; b=M8g2QCoexyzDnhon7iuTFNBAAQIKbJYudHfUTi/VI/mCdDLJOnw5bqTP0bt6qb69W7I/WWF9WxEZVicgfIo91VjPZF+yZKSUpcsgmfQdsS922CB+tYI+jhIhXNx8WOZZncRPt76vHNnpt6sXu+b4Jm14ZSLayRd700Vp0FoDjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537027; c=relaxed/simple;
	bh=6mA6iTRXWXZ1yOt7qM2S0V/T0zHayKp4IhqSJBG4MFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjDBiqLcZshMsIhbV8dHJn6tB8PQfIHR0tTn6MeZtSuhYQ/xvhwUS2HD1BoxwrXnFjXR/Nu3B3b17xqtKX50EhpYqqIdAO8luDnx86iobcyN4CU+7qZx77lDsj/wC9uOH9OCtTi4C8Puss2h1rrWmCM22k7oer0ANr7whM6K7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzGa3alC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzGa3alC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4197745f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 06 May 2025 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537023; x=1747141823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVSozHIL1R1kO0geupLABCS2zCL42BF9GBcy5eQEopI=;
        b=UzGa3alC5N4eAV39c7+SsmDiWDtNzRWGK6seEdZ2nwyq0MFnb+163Lxk2noxlXlyzK
         yHvB9JopgUAK6Cmw5Jz7BErXkIshWMSwhPWs6DojM4dYMsZm4hNRoB04GkXwNEJ1efJS
         0ipacx84IpVPLY5+QG7SdMtERjq5ZtM5AiMj2lYLzDkresYriAH+e2JQtwAriNSiKqQG
         20Do67KbVOxXQEvlzUtFjZupt4HYnMtNbe+qfhPCw3kP4mlK3FqPXZtR+XRz/7SHM+K0
         CK2Hg2DkzjXsewHA1m14zn49gVvlSw6+38fLWIts2R3OpPTGo1++MPMOXGMvRYVmEPrM
         kNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537023; x=1747141823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVSozHIL1R1kO0geupLABCS2zCL42BF9GBcy5eQEopI=;
        b=xPF+AHW2pmBDbIKrnHYbDNUDcopJhNjjN5JRBNA6bl/J6eq/JfmQYGBzC3noMKqrJ4
         AH5cCWhmcNwFA7eXFF11Nw9s6WcEBqcpBamdjMlc/HZf6e4VCs/FECPiW/zSSkCrYNVl
         Ic4iqdL6StIiW0Gmi0GDCaXuxzBM8AblS1+baMmMqmyKl8i48ipvylspBKhaZcn0vKCG
         B0KhPztCNglTtvWvteRiV4jROrg40aLZdqmzIiY5/g9O3CrvowuCQaVgRwyoVuJS2taE
         HPfZUd/ZYBAxv4r75xuLfLukaMMgSrdHoU5i5gozv0+puuGC/T4ylnlx5G1CqLAVjwjY
         sTnw==
X-Forwarded-Encrypted: i=1; AJvYcCXLcIUe0eqMVwJVIufgSkacrqEaFtMnLaWe6Ut0nJ8spup8KfSz2kXzQzkg1b2jaPAajsp39RZQ5sA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LlZIfDDJgc6319nzfb8hNcU+RoPCXqPE4Fn3H3Hm+Zq/2h21
	yyGn3qAGnM6JgFEEK9tlJe7EzV0tjZGyvcvFGmGQ2ugK3e1NhUC92+TibLgSJEW0WkGQuvTGA8j
	D
X-Gm-Gg: ASbGncv36aA+u7LJjqVsNVRgrI8NYySI7Tjr5cVfj9QxW5rqLBcx5tEwTmnQJG78GsA
	xTUgBywsjlV3XnCOBUqk8VY75rhCsICoTPuj2IhEqzkbJJLGrNRPvMJwR2TbJijrhezo6sjc7FB
	MPM1eGniilnkbM/6ufX75ea/Ug1DZYaiERVO3C4xExqN2C/UavRreN14Ih5d3VG84jhzUWq/fnp
	DbV7kAk2G5y+l0AeIMawkO5ZKvF6C3xdsT9c3uknc5K06sgT308YMNGtuxrSVAQAjphEBX7L2/b
	I5HMZhOV/ksSdIc5hzM4mtQXZ5c6/KUsthEU8stWSGm6hhI5fn/WgLA=
X-Google-Smtp-Source: AGHT+IGvOKJR9bQjNfDvrDffZYoLtEjrjFfhbdpqa82uUo012ez5u5VvKrhfKfFZsatuBILBuKkHHg==
X-Received: by 2002:a5d:5848:0:b0:391:952:c728 with SMTP id ffacd0b85a97d-3a0ac0cb3f3mr2514750f8f.4.1746537023357;
        Tue, 06 May 2025 06:10:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/4] mailbox: qcom-apcs-ipc: Avoid circular dependency with
 clock controller
Date: Tue, 06 May 2025 15:10:07 +0200
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8KGmgC/x2MQQqAIBAAvxJ7bsGkgvpKdNBtq4XMUohA/HsSc
 5rDTILIQTjCWCUI/EgUfxZp6gpoN+fGKEtx0Ep3qoA3eYfmoojOyGH9i0TYsx60tf3SKoaSXoF
 Xef/tNOf8Acc6CglmAAAA
X-Change-ID: 20250505-qcom-apcs-mailbox-cc-6e292bb6d40e
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2

The APCS "global" node in the device tree currently combines two distinct
use cases in a single device tree node: a mailbox to communicate with other
remoteprocs in the system, and a clock for controlling the CPU frequency.

These two use cases have unavoidable circular dependencies: the mailbox is
needed as early as possible during boot to start controlling shared
resources like clocks and power domains, while the clock controller needs
one of these shared clocks as its parent. Currently, there is no way to
distinguish these two use cases for generic mechanisms like fw_devlink.

Break up the circular dependency chain in the device tree by separating the
clock controller into a separate child node.

The patches in this series should be merged together in one tree to avoid
potential bisect problems. Given the majority of the changes is in the
mailbox subsystem and the QC clock drivers only have trivial 1-line
changes, I propose merging all of these through the mailbox subsystem.

@Bjorn: If this sounds good to you, could you provide an Acked-by for the
two "clk: qcom:" patches?

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (4):
      dt-bindings: mailbox: qcom,apcs: Add separate node for clock-controller
      mailbox: qcom-apcs-ipc: Assign OF node to clock controller child device
      clk: qcom: apcs-msm8916: Obtain clock from own OF node
      clk: qcom: apcs-sdx55: Obtain clock from own OF node

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 169 ++++++++++++++-------
 drivers/clk/qcom/apcs-msm8916.c                    |   2 +-
 drivers/clk/qcom/apcs-sdx55.c                      |   2 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  16 +-
 4 files changed, 132 insertions(+), 57 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250505-qcom-apcs-mailbox-cc-6e292bb6d40e

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

