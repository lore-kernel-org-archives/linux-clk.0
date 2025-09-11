Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671B31AF0E
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608851; cv=none; b=jbhvrQ7xMRWDn3Rp/uzQEIg9F6dJSC/ckaL/aPgLUih+dRvX42Jwrtc8j3JhCgAx1nw+BaMBBezUWSMjwJt2bnNfX5BO6sXWHeQ1CjdGuFl74x1ED+p1Bb/VMx+pUr01uXbTG0iLMkqIuS57NB9BHFpIjtvCvw1fvmSZAdMtLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608851; c=relaxed/simple;
	bh=PGUYgHqS7CEbT5QLDYSKpf+raKUBoMSG/SoVXw8S0ZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JCQ3zR8Rg3ov2YH6LqvblGQnZOTeZr/EVYk4f+aKOxgbSn+1F1qqD2PdsAP0RMuHWBkRAJCUVmZhC0KIpGhje4rPSQoE3nR2QakVN2gpI6MwdWWZLw0DFzM8UMF4/TR5VHf0KLSa0x1z1pBnzsDiDO6oaAcl34A6Z5EFrY1aGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHylLhz/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHylLhz/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so7418055e9.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608847; x=1758213647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUkbXECYsNALn3AVpSeO9cAaZnIpWugEqcmf3/zSHD8=;
        b=AHylLhz/bswBbHNEEFgE4zATHDvY404L/0zDC+EnupsYaEprtkhCphMmRcqCRumgDQ
         rM0xhDzqoWT7BimokK0vZMxPXh5Sez4XbUFYOc66aNZVX11sdpV1pOslprO+qE2zzo+p
         dZSkEeKFaOoBWMOEMiIYJR5EPUUGPV6Zy0jFESgpFV9iNJfSdp1QLYNTvBRvHeOlPUVl
         +06YZaxrRuatW1evM0OV5mtH6fz7WmtLS3ZtLzxZogH/nNgz/7+BaBCuuRlOC1OjXRir
         BP68I4U4cgTAobECUVtK9/RoyUW2vRDSlWu08TujidOHw7rINhe+rK/3Zatctc6jwlXB
         m+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608847; x=1758213647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUkbXECYsNALn3AVpSeO9cAaZnIpWugEqcmf3/zSHD8=;
        b=Bti9yApxfYeI+tFhz/F+SH3t7cBrhBLRBfnknfioqsZA5OK1jhiXHW9GiDwpH9W0Wy
         7kzO6qpvh+AicHFduSgUiR5adyvS/g6aCReib2ATpY8LHAp9gMJcYQ+w9s0xWbqZhErt
         7NcT8uQonqveDn9HklSHNCtKoPHbLCZyhIf9vyN3njhCt7ofD/cHD9Re1YSYdLXJaPHN
         qfF3qNxT4uWNuJ5RiEr6YbdM19JeK+Z+34OKb77v1Eznl/DY7bemknHQivUVJqB1Z5mM
         TzMYNBRY27BWf9mSkXAQ6EFAPHEbCvLuQJj3nNmZM5hgPZBD+TEUd+5h/LFobc0w43Oq
         B8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVdsLyNcz3dGpdCdpT/SmsJwwkHiprwEsdyJWD+tXA4Lq+2x8luWqNl/S4ez94KxoMAHdEFVQtOTmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFIzCli3DWccpD4ZMsjtN/9bXemsftb6z7lxm2DWcavOZaHvX
	6TbTo4minJDgTGLILiybkLqkFAxWumRZc61ZWtjjzqwyeIqrUNupLvbr
X-Gm-Gg: ASbGncsZhI219Uo3H5+H4PIJOSScUA4WkFGDTHGeJ7SmvnAMrmnP9yTNF+PGWLNtyn4
	1z8ITkE0KX1nAgYUrwpLaVZe4EPrWQo2Kb77XK2qFg89ZkleGr5kWiipf/dqEbsutsHG0sRCdsi
	ZgF3pUx1zpKykYfLejJ7fM50dlsyJ0Z3MjKtwvQST0CcQXcTbAY7ipf6+0zO+iem/53ybJcdJK8
	Ja5hqcUOtoPyazU3W2ZaunVV599x7uKgBS00OQT+Oro36lUsxHD0nmaOqXCfF8iId1Ucfnp84el
	OMlZNdAHT+kMQxAwk4DL85Vj9RB+jTYqQNRqpWzKtVNXznExquZqjlRNI86vWKTgi+bfOotcApg
	EogyDbURWl8D4m4TTBvA5sqaFBZh3YHoCbQ==
X-Google-Smtp-Source: AGHT+IH+e4l4aKUISAkDkWhELbFiMdLI/yWf42i3aNGaNUM7NHoqldoqBTm7FI7Nsal5lPBry54xSg==
X-Received: by 2002:a05:600c:3b8d:b0:45d:dba1:b4d3 with SMTP id 5b1f17b1804b1-45f21185db1mr1793415e9.0.1757608846269;
        Thu, 11 Sep 2025 09:40:46 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037b9215sm29772365e9.12.2025.09.11.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:40:45 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/4] STi drivers cleanup
Date: Thu, 11 Sep 2025 18:39:56 +0200
Message-Id: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFz7wmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3dzE4pLUIl3TZNNkSwuD5LQkA2MloOKCotS0zAqwQdGxtbUAm0b
 bTVgAAAA=
X-Change-ID: 20250908-master-5c5c980cfb03
To: Patrice Chotard <partice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=PGUYgHqS7CEbT5QLDYSKpf+raKUBoMSG/SoVXw8S0ZU=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBowvt4M6eCDUbwniAvFsl7B6c6vFEZGtq6YBW2O
 Qvzkm+meM2JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaML7eAAKCRDnIYpo1BLC
 tVZAEACJnq8EfqnB4N/xnh4xaA6NCv1zk6Axys6t8WWk9pLoeMLamXr9+zsfJ8YLhn+sTHNNtuF
 vV4zgzpXaotV5kWh9URYwYedts569Z3slS5u4TS9p4UBeFnyQaUzJFouhtCipwApOL+ghTccmNl
 BqzTj0bVxgu1CK6l4HuK5l9ZlsyQulqDDHXAGQHsGkdOdjixtND3iUtORyCL5wkNWW1XaYtxPCo
 oKLie0xb044BtXbtiON85ojR0dg4XVLk+mbPwDBqODW/7HqUUQa2EjCpg16+elAA0WQYkDoh0zT
 IjIT9LtBPEP1tU/diotyKuiBfbVkgcLKSoyxViMPM83xd3sKpjsyHAVssWIEfPvvng+Sr8D1iKl
 mVWWTuJkSsY4zXqoTgzMwJxylBu0l5s+nVlhao1zocKmk/sY+ZLCIQIMjufXWUnDWaauEcW2Ymg
 SesDSlR4fHfrTWCRnD3sqKobAnR2Z8jTucUwtGEmppu0kpnbcaKrMoH68y8z0KQwUguF8Gt+EQ3
 SGCvmD7PC6Qdy5004D5nHQQh0MvEjCxHhzxe0C83qeZa1U92VQwevkPsK9qpvUsXWpdM1k++2QD
 wXD9mdOwb7iAVSQdjlD3/Lavsoi3Ha5bte93wUXWmXKALdfkPAkA1KcimgEq9pEytPQJRXZp+lP
 sy74W8wCLcmL41w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

With B2120 board removal[1] several drivers are left unused.

Remove the following compatibles:
- st,flexgen-stih407-a0
- st,flexgen-stih407-c0
- st,flexgen-stih407-d0
- st,stih407-c8sectpfe

[1] commit dee546e1adef ("ARM: sti: drop B2120 board support")

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (4):
      media: c8sectpfe: remove support of STi c8sectpfe driver
      dt-bindings: media: remove support of stih407-c8sectpfe
      clk: st: flexgen: remove unused compatible
      dt-bindings: clock: st: flexgen: remove deprecated compatibles

 .../devicetree/bindings/clock/st/st,flexgen.txt    |    3 -
 .../bindings/media/stih407-c8sectpfe.txt           |   88 --
 MAINTAINERS                                        |    1 -
 drivers/clk/st/clk-flexgen.c                       |   80 --
 drivers/media/platform/st/sti/Kconfig              |    1 -
 drivers/media/platform/st/sti/Makefile             |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |   28 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |   11 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.c   |  262 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.h   |   60 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     | 1158 --------------------
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |  287 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c  |  244 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |   23 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.c      |  235 ----
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.h      |   17 -
 16 files changed, 2499 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250908-master-5c5c980cfb03

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

