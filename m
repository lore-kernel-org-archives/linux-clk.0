Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2620481643;
	Wed,  1 Jul 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911800; cv=none; b=K63KCQ3r4UcmniYAG4AxHPewToCZ+0hvx4AcF8uI+df0ZyDFaYe5C6nVT8y+SrXeCGXw7uWexFF41hnxoIPwwUQNEBXdplHzZWSlO47hfkDxdTvaoNBqCADu7ehdDOtYxBFRgMbvTEeAJ+G89lbadgcb9o2/LqBtUjbm/GNpa+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911800; c=relaxed/simple;
	bh=J2Tfr0KuUi9JJbAl5PXWWq9Fi5eRMYMqNrcCwoqL//k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QfbGT73q52bx1fK/TBe3QgPQsabfOyg0xHcfkCAG8m+aXvVFgtJxloyhF+CkVanqYF2+bpcZBTRGKWUjtb1XbZE/Rcy4JbrOcdUR0ns3wCz+LuM29/qFj6CAgYjihdbjFyBlP3ZLIzI1OKqx+KRGcJFjFXsnxb7R2IjWoYvfaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=S+BGghOZ; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="S+BGghOZ"
Received: from email.seznam.cz
	by smtpc-mxb-7dd54556bb-mmpkq
	(smtpc-mxb-7dd54556bb-mmpkq [2a02:598:64:8a00::1000:90e])
	id 140260b20f90ed6610e7d930;
	Wed, 01 Jul 2026 15:16:35 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782911795;
	bh=xENII8EZaJdwQWpJhr6djRtFKqHREofsbn+6lT7eUXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=S+BGghOZtlViIN8JzVsWMWdnuf7/QSckbRWvDG7HyVlH26ohSVUKBvulvpf4+RWJk
	 D3CoOs23Wza7OnAjdCnNSsXm1eSy3kuNfa6qwig8YD21AkVhNZjuNp+h3noXkn9KUN
	 qkIGYamIf3+v9r3lZw4sZdfNVr6WGcst9BZKoX36c1uajUexY6xs8ivOCI74Mk5bme
	 RfRFhKo08pETF5DI6HRryxtr4TW8BghqpkspipaGSh3vcjduKYgyDIWklShpQrgiAI
	 Skdx8aMungoq4sh0KVcyjRKVqIGLBRyTGAU/NPR9qwQeTzP7I+hEkabNy1pfuS2YYI
	 ZmfQCE7Y9+M6Q==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-7h56j (szn-email-smtpd/2.0.76) with ESMTPA
	id ee0831a5-5829-4d63-afdc-25c2ca5f626b;
	Wed, 01 Jul 2026 15:13:48 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH 0/2] Add support for Si549 programmable clock
Date: Wed,  1 Jul 2026 15:09:24 +0200
Message-ID: <20260701130927.3858536-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds support for Si549 programmable oscillator. It's almost the
same as already supported Si544, except it uses different internal
oscillator frequency.

So new compatible strings are added, and driver data is extended
to carry both maximum output frequency and internal xtal frequency.


Pavel Löbl (2):
  dt-bindings: clock: si544: add si549 compatible
  clk: si544: add support for si549

 .../bindings/clock/silabs,si544.yaml          |   8 +-
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-si544.c                       | 100 +++++++++++++-----
 3 files changed, 84 insertions(+), 30 deletions(-)

-- 
2.53.0

