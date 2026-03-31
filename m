Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7F36655B
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965721; cv=none; b=dXxfPpatMm/mfKjOXtNrG/Jv3A0qjPYaOaYPBf1lUNBegkPu4UnNEQz4WuOWmWvosMxy7AfQYRVe/d45H6hMFtPzZwn7KTQh8L3l2LLfufa4zkszOwq2yIWv/i0r3H9ibTTRd8t8fGRrwiIO7pEMpDKjPQnPd3an3q1ZbSTqXtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965721; c=relaxed/simple;
	bh=yAUREE9KXob3siMEqqlaveFtX3vU0mvtiy26uw8kM4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4SZNg5NCZ0eYhBc+pVhBhdPu7XPLQAjxfHHWkckgmxG/CjPzZ5yr+Djx/NsN8avmq2eu0uf5Y4WBhIYY21lOByTdiLdPmwzEouS6IG94jBnu+lQ/I1QbEgiWg8XjHMi4IMuoSNY5IvCdeF+QkMNrUNu8TJgnlwv0foZZx4xsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbdLjbws; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbdLjbws"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2bf521011so57637e87.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965717; x=1775570517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcETWGUFrYZgRLtRBP3C5Ptd5x026D08AAjZHrtbcUY=;
        b=tbdLjbwsUVTHmOSDh3YcPx4SmTNlvwV09ZQFh2QgpfmFX84zWs5zdoxX9V+Ina7Ciz
         s/3NWeXU7DO2uZISLdGdKFIdpRort073B6R8Z5mEkwDT7kxHtR4YbApbKSR6of9xmAJc
         gcDF2xPEe0BL4yydiMf4YxliSeNZQGY+4+YDMoWyrBB8hbyPWl92xNNZvgaQFH+PpoZ8
         ocW03X1/ZUg3GIt92KrVtf2t/GViV7qmPyphfdvi/HozLudv0LcrMlAe7/GrlzIZLOod
         B4Zy5ztLI21h8dKYJmlVcoHFxq51QwyB/QpgeyZmH7rNJ6wKPYMLogVPox7kjSLKwzky
         qq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965717; x=1775570517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcETWGUFrYZgRLtRBP3C5Ptd5x026D08AAjZHrtbcUY=;
        b=RbTqxR8eP18rrG3bOjUyQ7CeMPcSnfJ1Qsps5gU5/myShu6WkzDgQMkbTWm9rfZY1t
         1Vj+I94VizfA4eVBpUDpadBKXwXyoollwrp8BFFVN8+cpTxBmZajlsyOn2MF9ema7Nl7
         kT+cfD6jk6B4bCJyqSC8lQ6RzRdVC1e1VE1hLNrFFQeNXh4m9LPKmpJP4ADwshiNxZrK
         aA8/n9RrjtuIfLt5VEq3OlJwkizcuIIB9bmebEQwZ1ZitENq6e88fg30VCRfQ9WNFtgJ
         Cq+7ZnIL8y9XGM6wYqE/3HllzZ80FpdJeNgtQpaqya4bMUbflngMLqFo1yqWDxyU8YT5
         JHxw==
X-Forwarded-Encrypted: i=1; AJvYcCX9bMQuOb1AeftykFiOYDNrDkKpoKYC6ZF83relKiaIcK+i43MfBD1xyWlzWu3hdyLgHUB+TswHjn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsESdQ2AtqdNtMwNveWl8dr0Px86OsuQFZUlVhkUHWmZFi8+NS
	JcAwE0I/ePQKBt/BxssjzNA6kHjHFZFhc7phxCIQbg70pxDICxN4wmkNMYp5ci4tojc=
X-Gm-Gg: ATEYQzy7clAeLrlk2FwljTSMUKXev0ufyEsgfNzXa3/6Bvk86xIEwn/wBjs1J8Udcmc
	pdGusk3l1DQJWFfjv0ktAkc6LXVbNCSz2KhoaD/r/ZXItGhebQjrpMZ1E6R2+B78wXfitxXS+lt
	7XtPovapXGge7R+qizyX0+3dEMmNwu6t6mCqUbUaxi/BIzYNt4l7ws7GwmzRKanm+3MXyDG0ENq
	NJVaALn22PZMRrfvTFetUautM1oVeBasmCrNnuxtEvrcq6kDJqlNypErh+SM3VvP44wHfghl/S9
	M5DW15pFGoUODe5n+3q9M1UR7vx8Lj9Xjm2LZeOrSoj1Q9ip5PO6vv16zq8cIdcpyRRIlQNmYrK
	XxXgDgUgyfLAuH6rolkgFKNlBvgIjGYLIaa85oCH+8pbqaYv1/dUoZ28oAa/uSZn9lFx1wvLKs7
	nEw27QyiZYW1XU56xFv5iVtcubiHuR1g6RItzaziyU33ubg8IzTibq+xYY6S7MILaA2w==
X-Received: by 2002:a05:6512:2308:b0:5a2:78e2:504b with SMTP id 2adb3069b0e04-5a2ab92cc38mr3048709e87.7.1774965716356;
        Tue, 31 Mar 2026 07:01:56 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:52 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC power domain
Date: Tue, 31 Mar 2026 17:01:40 +0300
Message-ID: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting from Snapdragon 845 SoC CAMCC device serves as both a power
domain provider with a special Titan GDSC as a top power domain in
the hierarchy and as a clock controller, where the clock provider
function of the IP strictly depends on top Titan GDSC being enabled,
thus it makes the CAMCC clock controller to belong to Titan power domain.

Today the formal hardware dependency between CAMCC power domain and clock
controller is managed by runtime PM in every CAMCC consumer device driver
like CAMSS and CCI, however this is terribly scalable to any future
CAMSS IP device drivers, and unfortunately it is not scalable at all
camera sensor drivers, which are also CAMCC clock controller consumers.

The change adds an option to describe CAMCC power domain to CAMCC clock
controller dependency properly, therefore runtime PM management can
be simplified on the CAMCC client's side.

The series touches only platforms with CAMCC drivers, which marked as ones
using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
change, because camera clocks and GDSC power domain are not separated from
other media clocks and GDSCs.

Vladimir Zapolskiy (2):
  clk: qcom: common: Add option to link clock controller to power domain
  clk: qcom: camcc: Make Titan GDSC a power domain of clock controller

 drivers/clk/qcom/camcc-milos.c    |  1 +
 drivers/clk/qcom/camcc-sm8450.c   |  1 +
 drivers/clk/qcom/camcc-sm8550.c   |  1 +
 drivers/clk/qcom/camcc-sm8650.c   |  1 +
 drivers/clk/qcom/camcc-sm8750.c   |  1 +
 drivers/clk/qcom/camcc-x1e80100.c |  1 +
 drivers/clk/qcom/common.c         | 16 ++++++++++++++++
 drivers/clk/qcom/common.h         |  1 +
 8 files changed, 23 insertions(+)

-- 
2.49.0

