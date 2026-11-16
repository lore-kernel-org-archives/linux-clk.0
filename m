Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817325;
	b=vEhryg8r8E/vkzPBK6RnuzrH7g5VsOgA/iZinx3ExTKXkiV/KPXTnO9gyWO/gadiB9Zc
	 Lg/nIwuLvAvkzpi7OPnxiOExhwa1IzfqoPq4lkArZFrgpClc2ayNnHQA9MVcllDfsCe+0
	 8wc0CxWUh5Uf+2gGaQx+BsgR/8FWYwj2YSo64TuThTq8ghNabAh4ubnzGI6WyA4HRAxPS
	 FUIdsyJnAWAi4d9HzDSRr9Q7ZkW2V0iuR/0RDqNVjrxk5fN8f8hgpPL6jWNaNTMI64gjb
	 CpYJDoljTPgsKju26ik5Jwja4QxnSoNcIjHn8//702RRwix/Il6CA/BkBEF0JTL7vtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817325;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hFHwL0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=;
	b=lmH0quGEA9ayjEXD9Vyc1R+ji1b3NeKOaenb4aflnDiugZFyevPwQPMtqddZY2fuxND0
	 JoB00q9RveKaTm3/JBjk+0Kn7/O6BROwx346fkrtGoweW/eX4ZbXTQkq/Nru4J4ROsgJy
	 CtMdTQTF0ZD2NsTSgWLbMpRLTOYo9RElaHDh+rLi1jFQqOherIEoyT0S9pP7PQmSHtS34
	 sUElRZdQs9I2QlY09qLXqFyvjdk9IpfIG7Eqy6aQN1FE9hWjw1KtbbMQz3xRDI7CXuZbP
	 n9bpdpabbA/a6uqXCA7DtzLkERFb6/++/5Y9Hpf+eGCKzAl6CNJ7pPlDp3k+ZjHKE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C9606A331
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10C9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hFHw
	L0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=; b=a6f7XXeI4EbsDhCBF8mg
	EX6BluFyS6AAEdff0oZDzmNir0+tHKQfuoo9Ud2sFZnXmUqkaDEenLfPyMLoVwQt
	q9jxxpbDOp7Fe6Ie4a+IRFfewMG9IHTvnGVAgG0YFvkYVD02XuYl7bbFjToGH6VZ
	MC1T308y/oIwXKHChAX8Hvpo573ARyScH8pNA9GE+OEH433phKGPavS0PSlR2oCR
	lzl0YfbXf3+oV4J0oPwBp3EhjPWHkkfhATrc9Td5LkXy4YuegozzUle2gKLAaK9g
	aUD5estbCHMNCuTAydnLrBZb6ldUjle5Q+dYJ3771VHcZHXVtbO78xnP+5kAewtD
	kQ==
Received: (qmail 1194292 invoked from network); 16 Nov 2026 09:21:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:21:56 +0100
X-UD-Smtp-Session: l3s3148p1@dYeTeGBgHroujnv5
Date: Mon, 16 Nov 2026 09:21:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/8] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Message-ID: <avq9JH17YzYlO3Hk@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>


>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

I used this series in multiple branches as a base to enable further IP
cores on the X5H SoC. Worked fine, so tags for testing are coming now.

