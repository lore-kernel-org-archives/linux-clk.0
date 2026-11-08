Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.134.218
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=Xng+v/IFBOnQ5WYWDhSWbEUJ0tQLRvODnOTLI1uWlB5X0QKPINtXUqZg+jAlnWfY5C5b
	 BOSiVgdwWJRDjkFQj0DbZPJOiDidbS6ICTOE8taHi4CiIZXp/VUUZh6E5kiBgwZTaJXRq
	 q4jiVqUxMRvd8MaGYVeQ4NKNeRsaujXrtm7muueWphW/+p4ewE1x2r/RSX2Q6PN+r8d8V
	 n+J69SQCcYk17r/vXq8YwzZ11Ycy3rcNJBuynR7ovpUSlVd0fUGKq0rg/wIdzSorwVp0T
	 cV9tTOH62CKRxr9zewMmRrTK2SIHYCMPreUrSmXYBs7HKMIaXL2iYzPZhxu4BeZXxRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	b=uRJh3ExJXz6NxqfFnW+9NkUumhjqlOhScYPKSES2Oruu2u0O3KllMRhx4IVMIOkg/PW1
	 xbpnsgF9m65ojPHWhCsdxPOhqXKIjJP+60/9Ruri+J8YAB1YECuctsAznwI9HFpS6VQH5
	 PsbC9NsRcNhvGDgAGgJswEXg1eVAxZqzPkH9hZRizmFG2qAqJT8/Qkcahm1ciyDHIIwe9
	 M0MsUMGnlNOWhfz6iF9i4aHvggIlua59pkRJF20PT136HwaYJDKlrm0Rwsp1wTB3up90X
	 XmG251n/8Mao8blcJCToaGvwSwWRcMzSyItKK4xDzQrU3tQkRIrPPUqj5LStV1xo5hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b="MyXo/99D";
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b="HnSCgt/u";
	arc=fail smtp.remote-ip=94.100.134.218
Received: from mx-relay48-hz3-if1.hornetsecurity.com (mx-relay48-hz3-if1.hornetsecurity.com [94.100.134.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A980606A321
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A980606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=MyXo/99D;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=HnSCgt/u
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122594;
 b=AQJFfR8ZiNYZ1XlVIgrZWqGqMNJF4wzJxLlA2Kj0WoYo/AIMZHZPXu30AoYkmctB/c87Bwya
 8lJOxHZVSe40eXgxuCFp3AndS9ZdWigLusP/vAbXyCht8XPL1rYq48XJVq2GLDSLlDRXPAK3pxT
 BekRRUx5wpcvS+FTiOjH8Ni5t1OgGOvVWQ4Ii1hMYI0pquhzxsjvhqovIrWByqaeqgr2L37LH7y
 al9Bl9IgcB2Xj5Wr/GK7e8b+1rYOIKP6kgtZBkQCRKCgvn5lPE73aoTYOCjCVZd++YpCYZRhxmz
 ZvUGO7A5InUo++5qCZWo/xDEwJa4VbodQ+g+oE9fA0nlg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122594;
 b=sL/3xMWXNceOnCgDMTqh4R/Gs8MA8Zs2pEvEe/uutiHg50y4ADztc6fUT7GGazdnqxhd3kJ+
 g9bK2k6DAGHoazArfuE16yPHAOD0W+l3xi9Nx1b2fBL96ErWxXCFbp3lCZEpRbIl3rn1M3iUEAh
 PmeBuWu0kuX8MY75XPxEAHHKKDy73H/HDw398/rUmpEJGRQffccRH3xN3uf3mSEuy5b1ufHtYeN
 W6NVI35p3bPSAD6dKsfZkBbJsvDPlC7G83X/rdrpImCN714tyYzb9To0QtLVmje4I8Hlu518LUq
 XTBib8CxM8KvalAHYgDAv7iSYYKxkpfWBSVFEIlKJYlWw==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate48-hz3;
 Sun, 08 Nov 2026 08:23:14 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id A9FA9960126;
	Sun,  8 Nov 2026 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122582;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	h=From:To:Cc:Subject:Date:From;
	b=MyXo/99DbB+xo4d6YWFSTX/VnPG1er9ywKlnexkEgUv2UwKgM5mqpuTCGEq77FHfJ
	 YGbxXyuJba3jYXEpcRRx5OdEE/jt5wp3A0EUIbiu/czmbfXrhWKwd76kYNLETrkJ9P
	 +zmqNfmq1dsPArw4BMkEet/w4toWsAY4dNnvhfr0=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 0/2] clk: qcom: ipq6018/ipq8074: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:00 +0100
Message-ID: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz3 with 4jMksM0nFzz1kNbgM
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:33fdc7937bbbd520f6405a31ea0f80f1
X-cloud-security:scantime:1.473
DKIM-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122594; v=1;
 b=HnSCgt/ukN8C9uzbyQpkMQui0iWBdXYIH9X8DgJAnEVfDbx6yfYAruq/H5754S28LSJ8yZ+C
 wqDcpmggMLgsBOfwblERX6p/0m4mkPRMn2JZqGpwggaUlzoKf/zFrzEcSHs5AxWuOZVOY3dKE5M
 +Fqp93wWRFvycAo4iX94YOaQXbVVmHDWcE1ACMMV3sJABwN4riw9uep4fQJiPQMIsOy0tJkw2cy
 YixcqEYjZxC7U7itxgdTZwnzY1RLOkFBeNELfyZLuHsXsYNPtgccGfcPtNMi2bdq3qEeniJf9kp
 xOWPPwIMyW6qZuY+VT9E9LN2O0yRVGgMRoDVZLICbv5Bw==

On IPQ6018 and IPQ8074, port 5 can be clocked from uniphy1. Its RX and TX
frequency tables offer uniphy1 only for uniphy1 at 312.5 MHz (2500BASE-X).
In SGMII uniphy1 runs at 125 MHz, and a 1G or 100M rate that reaches the
RCG then picks uniphy0, or stays on uniphy1 with the wrong divider. These
two patches add uniphy1 / 1 and uniphy1 / 5, which the port 6 tables of
gcc-ipq8074 already have for uniphy2.

This came out of a review of an OpenWrt fix for QCA8081 egress corruption
on port 5, where the port RCGs were left on the RX clock by the
bootloader [1]. In the sequence I can reproduce there, the rate change
stops at the divider and the RCG keeps its parent, so these entries are
not exercised. They matter wherever a 1G or 100M rate does reach the RCG.

Tested on IPQ6010 (MikroTik Chateau 5G R17 ax, QCA8081 on port 5) with
6.18.55 plus the OpenWrt patches: after link-ups at 2.5G, 1G and 100M both
port 5 RCGs stay on uniphy1 (CFG 0x300) and pass traffic at line rate,
without errors on the port. The IPQ8074 change is build-tested only.

[1] https://github.com/openwrt/openwrt/pull/24566

André Valentin (2):
  clk: qcom: gcc-ipq6018: keep port 5 on uniphy1 at SGMII rates
  clk: qcom: gcc-ipq8074: keep port 5 on uniphy1 at SGMII rates

 drivers/clk/qcom/gcc-ipq6018.c | 4 ++++
 drivers/clk/qcom/gcc-ipq8074.c | 4 ++++
 2 files changed, 8 insertions(+)


base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.47.3

