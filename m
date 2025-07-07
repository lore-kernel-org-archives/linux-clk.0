Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D32292B3D
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882225; cv=none; b=OboI+nLtBTPzK82Yt+GgC6KytlDi6GICxyGmZJfYGubyX0VC1UwIw3tuW8YpNMF2+qt2BA4T7BDFr4rrLe+HyeChVm4aH1xQPH6EJ/hIRgwJ/b5tluHSsbT6P20+tLfrn0QIxZQ57W2YxjckucbQWKwK+PVimhypHCN7kwOaxnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882225; c=relaxed/simple;
	bh=58ZfGXq5HliUApxwu0tCwXNooa/9w1FGf0esQaJhPOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/zdD6rAP/qQ2fx8hh984F+y6qUhrkClzZ+DHCzbApVrACxxKlxTnYrfykh+WZ8wFW62eEnrZgTM+8M6FDFzvgOIHym5Mi4OzIKfR17y3WR67Oky8tMFPZkCAvHYQzoWGcYGqsBJjl2rq0CyQ9Pa4XHi2wuanYHltToRJuqwbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CkzlkaDS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CkzlkaDS"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso3839219a12.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882222; x=1752487022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODEVf5zXYu0yH/oCoUjJ1b0O3E3Qx4wf8X/BiLQdvvE=;
        b=CkzlkaDSHWgFPkzUuWbqSWxfY28RE+ODAcJInkuPJZo2qybcc0SXwHZ2NwzlxSNFcY
         uC+IoBh88Ke2MooK3HDhp+X/1ueS5ttavd7CaGax2ma+6pB3bWNMg9xrk0vlLFym0lam
         gZQJfe5kS9dBqabcvsO1UrUwxJcV5DSmLBrQOhHtL7l5mqZIOC5y/JEQEISzR/B72m0+
         tyI6aTRKkZ4XRmeuaVVOpzDJzzb0bzywjYABOm66RtlJo5ivlXyd1CH9IOL9Uqy+cD7Y
         1McIoHK7y17X6d0SGtOSLJ3Sdk1fiSlUYDliVdCQjq6U4GLuy3yMB/qx+DJvNBoSKgQE
         FDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882222; x=1752487022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODEVf5zXYu0yH/oCoUjJ1b0O3E3Qx4wf8X/BiLQdvvE=;
        b=MG0ii+l8J8Ff+yZX3/igoSKSC+SxGbMWBiK0PCUsU1VCNt8RqDOHSYipPN4ZpFEFlX
         udAe5659jRYc9XUezLjhOFMnUtlKTTjOcMw13cZvoU8mOOiaRE9seDMD940U93eNtya+
         A2Dt83oDVIgidI2B/IO6R/Tza6PZamKFtNoClTxdYq+TS9orY6DEyAfBgio9fKL3bHFz
         AjYPiqQSzWwk0gmZNzxsc2Rq7AOWfguSbZhxp80YLZZI4jsCGPrK0DKfvbf/U5SxF7Ro
         o1lYpBmGdBcCi3wGZJe3KEd1eOiw/F6z9LXogNMbKxki4sC3NuABCMrG53bdC+DALbls
         bMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwdPVtFQHs5kHq3nsDfguVKrjt+oIm67egi9Vzj9VnmugLysnBLyS5w8qI9E0gAI6BsucrTReHTrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlkGspcMASkZum6H8ak3aePG4iqoV43cC7KbV0uKZEnDD8p1A
	LbgNZ0sU8xKJGFtHt2kUlY32tKCr7XYaqflMSB8arNS2zFSgVvWU+bcbIRXJ9LsJu9w=
X-Gm-Gg: ASbGnctz4i22kT0snIFZwbTfoP9R20Hs3AirpXGc++cpKSjYdRTVe+TQJmwKMvpu0eH
	ipS3C2fR5bEJsmGW4Aabt8FhFduLkZZq6w8yOpcMvVZVjhdGIZ21pX3VBCh2u0phjpoP3es3rHf
	Rg5qIPLwFUXl9boSU7fqVOWp519u189EJCbBaX6pgb+tVwTQ77huWwV2fga0qh8rtcTJq9eLsKp
	oHwcqt944bG+d2CJVhBwasyJ6XluFSoDvkAttIlQc9b7ae1HnPTkPfUoGUahS4uKnJF5WreIQe4
	4zO0YJsGnJ6N44/jSAAp6avtl4IU0dbkev8jHnsygAr1XAl6GQ0UbGDvsC4IfDxtuOEB9jTxpN2
	Q/WybnOiBK2sJUNgLPTVYwbu6JBF1PLL01te0oK4Oz1g=
X-Google-Smtp-Source: AGHT+IGZ95rMuA2Wn1IQaIyHUgRgWlbpUIuXzYBujf+9D//LAmIETPS+IQZyFCmoipIJ+gohRL4NQg==
X-Received: by 2002:a05:6402:d0d:b0:60c:4a96:423a with SMTP id 4fb4d7f45d1cf-60fd6d504e4mr9543330a12.18.1751882222225;
        Mon, 07 Jul 2025 02:57:02 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add RPMh and TCSR clock support for Milos (SM7635)
Date: Mon, 07 Jul 2025 11:56:36 +0200
Message-Id: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWZa2gC/22NQQ6CMBBFr0Jm7ZjSUhRX3sOwqGUqE4WSjiEaw
 t2tJO5cvpf89xcQSkwCp2KBRDMLxzGD3hXgezfeCLnLDFppq2qtUIZDbSz6R/R3wYHFowrGNq4
 7GkUO8nBKFPi1RS9t5p7lGdN7+5jLr/3l7L/cXKLCygZydWU701zPwXGa+jjS3scB2nVdP8y4T
 yq4AAAA
X-Change-ID: 20250620-sm7635-clocks-misc-0f359ad830ea
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=1169;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=58ZfGXq5HliUApxwu0tCwXNooa/9w1FGf0esQaJhPOU=;
 b=+qWmgG+A7sZEea6VSnoAqFep+mSdABlWvwutydJ/nj2l3sV3wTqA8VZ4NK8OmD1XSu47kkMKg
 b14o+/g1z3cAQoJJvs75BQVX+Exk4IdHgAOUqAYt2d15JahfmKekkk8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support in the RPMh and TCSR clock drivers for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Pick up tags from Konrad
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com

---
Luca Weiss (4):
      dt-bindings: clock: qcom: Document the Milos RPMH Clock Controller
      clk: qcom: rpmh: Add support for RPMH clocks on Milos
      dt-bindings: clock: qcom: document the Milos TCSR Clock Controller
      clk: qcom: tcsrcc-sm8650: Add support for Milos SoC

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                        | 26 ++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8650.c                   |  8 +++++++
 4 files changed, 36 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-clocks-misc-0f359ad830ea

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

