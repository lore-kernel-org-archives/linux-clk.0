Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE06516150
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681971; cv=none; b=TkqEtg2ZkdByISDWAbKtbCy7ftgjzmzYxPMBA0swpBNHJeCIYnFOGNPaXpkyw3tBry/TYvVmsNxCI50nWgvfgZBRV0EuYg9F8Z8KqwSoscAIj9uXcS4RbYKqMeiLpuepz5xnZcdLpVSJN8+hPR2Cu9y8Hc3cUXZRRJhs8G5Q/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681971; c=relaxed/simple;
	bh=QaMnkzX6EqShlGHNFpyUbUxZqjzej/lVJ2TWucKRB6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQEimlODFs+oMvzhWWOtmK8OV86T7Rv5QKRFlh012rlBdcaQ/5gaJHw+KxUUxeHwC2cX+Ovf36HDaG1CbayLOWoSj4M6KSJggrw5HqmiO2SUwzc5Gct1T0PezIOsnDEfEjOujGVXk41k8RIWhLeq9CQJMPIc8+BdiPtd+EOWlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXm6e9c8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXm6e9c8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so17696975e9.3
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681968; x=1791286768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=HXm6e9c8UAVxBE/jwrIo48Cy5NF9RMVUsQT50UIjzdGuBcxKQCK1HC8OawAWu+SBUD
         lK52J6l0W13sVTif/tzJgVSF0JLW7v10yWrHV7XUqP6Soc9sPLQOGv3fF7gwhGiFbq6+
         S0SZw4fO37dwY5koYu3wBYPOaBgf1sXryqLcl9tpKF/JwFjkQegjD2nJi4TdvXnxs8eE
         kifXDFEnx6pjZudx55xjwoLtFCrmQX01lljQL4YERGnX77oMzF+FPpRNASTlAO5n9P1l
         V73wGvkwqf5OdeS2yUvi8RHM2cwZ+0cQoG+MT9j3nJLgs3dMnsRYPjrz1F7J5XpxGoEE
         d4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681968; x=1791286768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=FklS2nVTcAT5+tIwvz7Vcrh12qKzK2zXIA9UEPagKY1HfMnj9q7nfT3vpo15b950W2
         JH2SS6R4wBwlM4y+fT3qNqPyNVjCzLmQicGRGxasF67iKs+3Jcu5Rfkmbtq6gvdj7C5G
         1Q2GETNAMUSO8t7BdC41XOYCTmMWBOWkclQ5aMyV3ec1KdDv+ym3aJRdPwnOla1zJTjn
         8JgiiNuDE03qUr4Q1IqJzETO8tQFc3zZNuTVP01cxGUuDulIVulfpLYyG47K/Y54W94D
         2EtjSb0uDQsElz1vZOltapyTdzgWq0VtMGXHnJKCmLyryL3WxhqHYvS2a5E7A233kFKj
         bM+g==
X-Forwarded-Encrypted: i=1; AKwUvBxXix+0lpAa/yAj0fNJBUeZMerx2iX+lcSx9JVz12pzzOYnKneJ51S8Srd/PkPM71iXuQczbCcI1O4=@vger.kernel.org
X-Gm-Message-State: AFuF++lpll3yGJRxSoGagiZtz2TcCNyUQ4bEKjHXqn0K4RqOBGKjaY2E
	NFMtMYBl0gB2SlVFezs1OiB6fJNMMuQ53Shd7jEUksRD7expGqa4Pkgu
X-Gm-Gg: AYBFou3UOtuLeWdjUdM3mCl1uuJLXtAnH+6JOhgxHH3vmPs4tXL5zn0IyLXL8xP2cJW
	LJkX0hGy3nJXOuISNUYVcZzbgWdvnOGAIzMwmJJXbNwEG3gySUFtdsYk7252xh+H9QkVftu+x8d
	MtyEy8sg4NDtEd8raBdYOrJuqAWnjNgV4z83Ihn8EHeqtb+aWQ9gyyXDYQGTYUeQwr0umZw2A4H
	UzCa1ekvcCftyNh43uv32l9aXfwrFXvHcg9Q0HozL2ky7HKIltcO//Jbae5ZWu41CviKLz/tDrY
	wPmSfH26zYQg6vYOUVXGyoDhSKVyqxyx3iqLhZCzkw2CkHo/aS1iBXKfnkP7dE8/NU4c+9g3CjE
	ipqQoXi+gCx0dtO7BgpxXD6xnZA4JdajoqDjVK45TrJeCY3jkSxCk+N7W/1N7zhK86ouRy+KMwz
	ynM0JdKDnDsIG+rOjHOLRzhiwcq/DKGHQnS7QOzon6Y3qqjICzT9m9IOYruRxI9fC6PcV50jmie
	ASMrXxJCiD+MEdJF+RnXplgutUbXOJpsZntlqyTPYGLrlnHuaCT9ff+eeo0mMJHQh74gNdJpt/x
	dh8hVjsy+uOaQLvDPg==
X-Received: by 2002:a05:600c:1d06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fe7bcc25dmr261575645e9.31.1790681967977;
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Tue, 29 Sep 2026 12:39:19 +0100
Message-ID: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.55.0

