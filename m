Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388816;
	b=ZiNrNQG9wvsa9xj05BeMDWdcptE6vwFJYu2vOBj2qq04Q9XvLk+D4dH7KtOt+46oJ+Dw
	 7t1TjxHJroclVWMk+3BnEyKktqkMHMTphtiPcDq3gH61Hchbnzih0DfsXu360FevWman2
	 ysFGEz7K/JGBR/oAnljOtqvz/Vpjsiw4XhPsv50yKOdsp3Uwc7WgfQYopZBE9hVUTUasU
	 JQ3K70uq8w6mGUWYA+OWRExE502hJ054Na3tg6f5gNaEK3MHdZ4hUe3+3KsQ2yhvhaj66
	 QR2AGYSGh8KOQBi0yY4AcklUGbhyYB3JXyplAWANjI8jYnKz15ZwNL0luIdqznLG/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388816;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jPHQU+9wXfFcupAO4vYQAzpuQPGZ9v1Qdy5LLuFL8Ww=;
	b=iPgIRd/vfPt6yMyTngTXeSc2MBI8JrgSuljFAiO+kg0mYJ87WCVbbxpIGn8I0/58Hqu5
	 tfwdRmouApK5D+IPSnANKMd4Dd3fmIs+XiMIU33G54CgdqGVzZw6ecGupudaHvodpOSEq
	 QMtWHsJOAQCT9/xnmOgjtTk0+x4XN628Bh9yt/nyKH65OhOxcqjdjyQRCN/0mzz66KnGq
	 yGS/lzUqNY/mm6JYn3rchYsYc4NpYbZO16i4iFvJdYb8xcbo64LP8os3DBlX9P9/5iNYF
	 3eSHhEPjMshsj2snx04u78UwuKx5+gDQMmBSVyzeO2l/8xI22ehKnHHyfGatCfl8fzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A4Y2b49y;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FF606A31A;
	Sun, 22 Nov 2026 23:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A4Y2b49y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jPHQU+9wXfFcupAO4vYQAzpuQPGZ9v1Qdy5LLuFL8Ww=; b=A4Y2b49yIgBkWlFP6buQZN01jp
	J84dV9WXuEMPn9lEjWR0wjYVK9hL/pkSMDVBM6uSB9Zvqt9WrdoDocm2A/J/uLoKuRvoxAVQlqoLr
	BQSVfFrM5e3/XvrqQ0EEJkGgQk4vbqwae0yZMEFDOoVOniVUwr7pOi07tn4OrsHVzohxqAsGXrWEE
	7MPkF92hkToFvDt/GvWdq451N4ryis4zLAM4S0o5ha6clmYl7TuolEckpxt8BlWulm7zmZpT4lwce
	44rUJiOUe4QTP+hH5EgJPE7PBIkOQuTQnAKxiiAN5lC56YesVfoq9ZLuJYfJ9ttewLbzErkzgml+8
	OYTATdhA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
Date: Sun, 22 Nov 2026 23:50:30 +0100
Message-ID: <179538782486.3150822.15627188420950858780.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030073638.164388-1-ylcncn@gmail.com>
References: <20261030073638.164388-1-ylcncn@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 30 Oct 2026 10:36:38 +0300, Yalçın Can wrote:
> On rk3066a, uart0 (0x10124000) and uart1 (0x10126000) sit behind the
> AHB-to-APB bridge of the cpu bus, as on rk3188, but their pclk gates name
> pclk_cpu as parent. Nothing then holds hclk_ahb2apb (CLKGATE_CON4 bit 9),
> so it is switched off as unused at late init and both UARTs read back as
> all zeros: 8250 autoconfig reports PORT_UNKNOWN for uart0 and a serdev
> Bluetooth controller on it (brcm,bcm4330-bt) times out on every command.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
      commit: 5138b09d66f93e6e40503043412e8295142570b6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
