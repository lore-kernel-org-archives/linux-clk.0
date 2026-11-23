Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394352;
	b=fnehTOzWB0Yo1pysjtYkCkrHETPxq3Rms7OK+lniRy4zamfD/TPse6LQbGoom9oRPwp6
	 Fnq18k/vhD19XS592DwR6Z/Q1+0pSXnn7mp4JF+26FITYx0//kSvFR17bnOCZ1CX5cab4
	 gGzjl8s01MRl3RwvIqCdF3+TpY8QCJHKLMrjjnY0N2xp0IrvOVoQptLqdZkeTsZNMV/qp
	 XqzCTpxE5J6jOBLLBaTeL99o2C8uvsRmCXwMDM81z7+opvB7hWSorh1agYIwFp8MmuKZX
	 FGXlJdVDV8WxvtceH3+WuvVKh4C0kpjfWVdTnbaxDzRzrcV70H5ARvNtkIjLrl2L1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394352;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MPHGMKGLL0OSZ80y6M4OLHQpLzHyeIj4vIBfwx7QpDE=;
	b=p8iw5lfl7hCgM8nwcRoDrb9OVXj7z8o5nsv/UzzA9V8qSZFCU/sP8yGYiyk9Edsxtdw1
	 0Of4gmSoaDvGp32HqF/eSzdwkeEjan0w5Qkkuefqw7yCJLbkKnWxT5nR1E2pvvgVZCMjF
	 3E8Yh/zxdYvC4XONXlv9ZEEz/OYTTYkXltybIF3uXDTXyqVWyx4zekcgSI4bGM/C7De4f
	 EiTHxSW22H02V75msU5+2B7g5cwCdfyqOW9kd2lTsSldMvBNt5rtqWUJQqvbWM3kw61qx
	 z3ZSgBMTYAfN1TzLrhVH2FOW0kq6BO5k3sk72T/CZGnj3QXjvkJ4mxCDtnvSEebRfCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QH5c9UDx;
	arc=none smtp.remote-ip=203.205.221.233
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282F606A31D;
	Mon, 23 Nov 2026 00:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D282F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QH5c9UDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394322; bh=MPHGMKGLL0OSZ80y6M4OLHQpLzHyeIj4vIBfwx7QpDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QH5c9UDxLuIGDbj7QKUigYVqiRMBvIikUOl0D6Z3KtTUDLj6oc1XDm6wYx/yWyIPz
	 NtBdRIV3CECrtN3COd//5WKAKTPlqBi7K2n1wHlgf3Vn3y7WY5e1mY1zI0aawMFiCy
	 iIJESl021ybK8oxKikRxVbmAo76//uvuGkhIr4y4=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394320tadcorimq
Message-ID: <tencent_452BA245FE6A7C7308A5121F5281E9E6A807@qq.com>
X-QQ-XMAILINFO: ODQfruXGvXmaHGSflDLohQ+6OBZ5C7KLyZZc0k68wD8z/EV4BhvQ4ZJ1Q3zrFa
	 AV8ezUNgi2XjsU73Iwekk1iuRIHUyUeRrFVUrpv14Y9BrZj6m95fZPMd4JHCIAh8nxSitiVgFqEO
	 sbc7w3XMxcB4O0P774wE1IxSgexo6y6wWIkomPnX/xSrCJR+1nbdVfX4lGCkIBr0RkF1zOgU4/Nb
	 GTLbtz2g+ih+i9Q02wioMzE0d3KkOE+fhT1yJHl0KN86K7fmI4l4AAm4g6eQjtKWnhDTws5Q1wl+
	 qmmLjgxQu0pZYLeTHtXYlKICt7qIbIAq+LsGBNFq8HCmB2BzpzQBxMCqlX08vZQOkZOIJUk0oPCR
	 w15sBzrehReaLjQMP070Sd31IWf3FAtWS0BnJzvNVb6R/6Jml2GC1J97wUKXcokLPDmfMDMojcFx
	 RUreQWCi0/7iK6yEupiqKymKC8Eh02FFUqDtjK1wvm7iCrIKGh61qlb7JZWQVdZ9yA6vzD+M3Atl
	 8JxDHYvJtS8mzf4X5kIqJ3JB/xEla1WiOY1+qPnA6XdmKB+0qiUtmh1iB+nMxF+nFwLNF86/2GVg
	 QKwyzOYfcc+8gg0FNm8TkcR/uoMQ88YB5yhM2YlX+h4JjAQZyoSX1iZI5iCAYGbTSKayP1XI3mhe
	 4amZYcYsTyKtUJaJ0xQs9Q8Ext0s9c3pnwuzb7yiEJ6K3ZHaQYqVGb7UDYZwS3FYA8TXKd2pWejQ
	 f7WObn0MWcCkvp9VOliJ2eKp/mtPBM4hMa6yKSepBrA8yx2bZEMfBrg4kWgGiAUM5GanfasCOvmR
	 EP3nGkh6580kQqfw9d2xz5wXWILUiBq6PVcDWQNNsHpM8zvOSAME+AVmc4hsAfV5nAxG2SfExSFW
	 5fi9bPbuWHbY5yEY2OkWqFTmQzLJn57Z4eUBphdfcFvbPjAX/Wy80sfAEzBpeK3UGZ8/15JB1mPp
	 LPaN3o4i5YzZjnCHpUkGFOKfpa8oQkdu5sDoLJrmfnMDe06Fg1I17zQKNez9TZhrur+9fuJVaUWv
	 A3RxeNS/igwuijzN4dc3F0WsTXW4uctB1ecYUo3PjWEkF7XdA3yDQhrE11ebDtfT7GXZ1NjHi7Vz
	 tNHxwMCKuy7Q6PF/69XmUH3cs/6aRdDjirw1AFtcJ1CkATpRxr+xHeEXaNLyYl5efUPSKwc/QF5n
	 5ehfCsKHpBGud4x5FJRjfKBC5ikpiKlOsGvBWBupe1Fs7R4Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: soc: rockchip: Add RK3506 GRF compatibles
Date: Mon, 23 Nov 2026 08:38:34 +0800
X-OQ-MSGID: <3264c450b28efcb6ced51719182315728c15bae8.1795394137.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795394137.git.1194781887@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
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

Document the RK3506 system, IOC and PMU GRF compatibles.

The PMU GRF is named rockchip,rk3506-pmu-grf to follow the
rockchip,<soc>-pmu-grf convention used by other Rockchip SoCs instead of
the vendor's rockchip,rk3506-grf-pmu ordering.  It also has a
syscon-reboot-mode child, so allow the reboot-mode node for it.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7..1fb1bf87 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3506-ioc-grf
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
@@ -93,6 +94,8 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3506-grf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
@@ -234,6 +237,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rv1103b-pmu-grf
 
     then:
-- 
2.47.3

