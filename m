Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681575;
	b=doW93+hZosTqu54ZQAZ03dHgl07NRRl2TlTceR22XPsSp8BG+TgC/y+sgqxjT9bJ3t+f
	 7HIRINL8o4Lap8f+9eVdDPDKHBS4U4zBovaBuAAt1l6zmnnWJbt2PDUwvaUy4SWGHUi6W
	 TWNcU6wW7S/7vP0yl2vB3j1ZJGVrzn7lPNAXKuhb69GhefXsXRpLlf/xzUaynssHJ3Vpu
	 5Ctz0LjDLASSxXuZMIto4jur3JdHSAiU3kUwhShDu6qzlmaWnduWq18oHzXAGne8COM7S
	 LWjNCf45BtI0F9dcmJ1Pzexln4bg99bdrwruqo00ZLW2WeLbJp6xeTI2XYygxW5pUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681575;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=VKh3LRPiqL+qmHvwynO0AT4XxatCBMljpCiYwmyf2vw=;
	b=TXPrK1CnOGmWDMdxmLjxbirG0FtLb5PL98/pN8ysiJRBwv6awIo8fynmTpuMuGZwZelj
	 l2K7z0B+2pcGObfESEaHpZIcXjULenFAKvba+rZFbJWqec7NofBstZsBcnBeQDkSv793j
	 CRQX9fA6xinUlPZcVAIe+earvYPbNBGdyvCHw29gY9YFDIU3OOTv3/dZ6M6vKk+PR8e3Y
	 065ZYM4GrLuhgjlbkIYmlkBcaD12/z6M3cWwR089FTVyqu4LCvSw93kzz6cmEcVDlMNvP
	 Ex1cskbiNp202JFJui6Jp+wy7F8Oq7DeG4zwH7GTGlfzMC0q/2wYmKisy4PbZ+Y/izg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="Fd6XlyI/";
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6F606A32E;
	Thu, 26 Nov 2026 08:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F6F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Fd6XlyI/
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5617268fc;
	Thu, 26 Nov 2026 16:26:04 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:03 +0800
Message-ID: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f637c803a1kunm4b0c20ce3c29ce
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0xMVkkYHx4fGE1PH0lJTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Fd6XlyI/YzbJb7sHYEK/rZAxAwNyTs1vVyeCAcaNDO79fJ9fLQDvJj387CJnRkXFdWxMeON8g+cFFbXF5rnF8CGCIwWH6uF51WKVxyIVmCM5TGtVOZmK22ZlHcyAQtStfpBEmugQ7Kq/YXv4NhtCeaJ8c5Ivu9M8ubKHIXi7VUo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=VKh3LRPiqL+qmHvwynO0AT4XxatCBMljpCiYwmyf2vw=;
	h=date:mime-version:subject:message-id:from;

Pair apmixedsys clock registration with removal on four MediaTek SoCs.

Guangshuo Li (4):
  clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
