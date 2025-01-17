Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA8200115
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122056; cv=none; b=OP/goU6Lwdpg3mvqmbt2WhBpWHJ7Co6NADSRpTY6gAThewK1QlVV14pjk4VOu2lfMuu6TjypppaxWB4xPr5iQyeCVqlIY7y2lRu6FSHh+2fBKHrokFeE0dd3UqEDa3MjdqiKt1I+9eeVAdMqBGe5YPibcrmm+dVVyasSQDByoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122056; c=relaxed/simple;
	bh=1bB7zeKYEAvds04CMWVz2vrkT1T8fqTENFgm3Croh80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pisMw7erBUkvqsv7/53iNZ8jE+OVDiojGgexjKcqesFN090UlNXXbeWpXOVvjhO8KTUEa9XqW5f998tWYoqA6AMFkqbo4PhkREE/vjXQ8JwupcPxNSkZekgPPj+aFro+ECIYL83yDNbyD73raeotn1jks5RkYyPiYiBGzQOqn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnVR3NzC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnVR3NzC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1131091f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 05:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122052; x=1737726852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqX0V1eNStAoo4sPWKD9j/tGcT46bicfpPkCKdYvW2Y=;
        b=SnVR3NzCUmvpXnDtqZd4tKvH5ne1HlBhOpgAJL2Zaul60AYcGOB9AXg3ih0s7oRjBo
         PBS8FO89JcWfyBsXcu+6A3ZDv0f8MAYdN7kM26ll1KZugsJoUj37Ep9ne5LdWf2a1lgy
         a+APGVmxaEo2yVpUPDagg6qT8eRPopp6ydRtESrro88FE4afh6Yu0BTI7WaP3XFLpxAQ
         Dps66CkoTEvkCpnWwCWWma+KaX/dVaD4VNLBDbm/fXupn5NS3xZ7xfVXAiU3Kg3q5Cdm
         0A2rxYE48MFGW2kXnJuIw2fCQNIGtRxI+G76yQL423vIpbFjLtFHxH5kvesqjoqI7qD1
         gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122052; x=1737726852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqX0V1eNStAoo4sPWKD9j/tGcT46bicfpPkCKdYvW2Y=;
        b=XE6F3Qm8748jJscV5UFfHBDxvDLwViYG4wVPSGt3JjXoDLMCxKQFzGo/tvcYC7n3La
         8Odt7iNqXmnIalG9WFUDfOEC+GnI6CqO7wdxQtIDt7NXHxl9GNbQMKt2Xvo4DN8OjWIp
         dI3TwoeAvV0QiNI3CYXUSgp2WoPa4q95ayErcP3inESkzYbl4iDkYoMnWtRq4HZpPPmV
         8hlH2IugmblBfOgkWE29YW8yU6VTaJ4333btWdGdLtqgfBbZj6o+M3YLRuMBbYgBxsx4
         vSrE5qqS4tOF6aDWzL48/87IJ5i2Y7e3TXM1kV8/ew4OergMWABn9KZFNyPgqagsUsrB
         F4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWxUCAg44Zl6LEOOht/uen+CJhX3ZT50YzdtoMzs1dIm+cHbqUW+1qXiUzwIOl9Z/Gaz1Xgdz59i6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6HoZt8dvtubxDk/TQhbSMJgfq+Jv97I4495xxcysmXZbLYMP
	QxpWmER6ZfhKDdRNicenFMKWSuT/+S025uNRLUDTq9seMlIESy21ataztIvS2iI=
X-Gm-Gg: ASbGncs0RyQzzbpDB08v/FF1l0M8UMC35+D3Td5MslAs9/qC/OG5bmVZKpLPHddsjV8
	At10fMBYdOwfq69AiBdvijdB1Z0jMO+DGqt9kHVwtS/YgAT9Aehepj3ZegG/J1X/FmE4vq2Wx03
	zJhBCvFuDOdOg4nWW3NAPReEWXwUjZ2TMDWhgbMAJR1h2w53gn1WwM+9k+OQ8mehwXvozydD9b5
	TIQO91wsfsnjDA8cjWX5QBAbXG8NU1YBgdH3IGamMg/N/jH0xS3oswhrm5V+OV+fA==
X-Google-Smtp-Source: AGHT+IERIKprTfj4TGtNFTV+dziWvvun8Na1x5lCmNRgusK6uCzT/L4ml4i+lIBUsBATJIfoN1WugA==
X-Received: by 2002:a05:6000:1445:b0:38a:418e:21c7 with SMTP id ffacd0b85a97d-38bf57c0546mr2616282f8f.53.1737122052049;
        Fri, 17 Jan 2025 05:54:12 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:11 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:09 +0000
Subject: [PATCH v10 3/4] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-3-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.47.1

