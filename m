Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392650;
	b=KX8rR3myI2O4kDxGOWgRZyZO3pRbfBmkNIdblawWgKc0OaYGSm6QxzI1oFDrPAsjgjzG
	 mA1Y9zwIUIOYE87duPIfjcgPR9tQZIN5wuDxduQsIKexWlAVPSzFW4cDVNubPp7HM/qwv
	 rTe1B1XuFxiEGQxSJxpA3wkvyHjHwivKjH559NLki5cTlHnArHwlAVv3jLCRNj8dHADGS
	 QD91RRMMQ//8BA8JrxGi2TH4DxL5Bov+Sdhw4p+Kkp1ByptSCZ9J46L0vJrp1UznuV3ZW
	 9jbK2ccvR0ZYUbhHluRDSKY8Dp7+RzQ3N32qvQkKHtyj2xQ9RpmDI6FpQIem6HopoaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392650;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zCzXcB/gcPUK0OBE9Ia6L1IFSVcN8lBVdYQJrZSjFyk=;
	b=B71apZlogNBZrSvAStn8ntejyKe1qT8WeOyWsIJ9oWst0psT62DTzM986+RdhDKva0M8
	 5rhGMtyvSys4yEmUgKP3OoB+Owo4E1ohJEJSm06hKJ1fA03EGgmEcD0ejD+KlWmeZwY7j
	 IZfqz2dURxahWTs9r4YAap9ynr8/d7vDbrvnW92PqHoNHGnqlLDzJHuRlcsr17qr0dPqp
	 YDNcWkUEx5lCwjDv7ffahlCIeh4fxCEKO891cElYknTh4pvvabJuNryd8StDtmYjDS+Jh
	 kWaimLFI5aK7szP/ECltHose+KGoO5itqpWs1yfWtqZojxvidAkYLU6qpzj4tZrNfrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KhabOH+o;
	arc=none smtp.remote-ip=203.205.221.236
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE94606A31E;
	Mon, 23 Nov 2026 00:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE94606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KhabOH+o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795392635; bh=zCzXcB/gcPUK0OBE9Ia6L1IFSVcN8lBVdYQJrZSjFyk=;
	h=From:To:Cc:Subject:Date;
	b=KhabOH+oIt37Gj9TpdCsGiDPO71SYpLBp8IU0XEabvp53J8olfS9CUVoXWmZXOFjc
	 fCNwkZ7mWkilP06CCxUI9ES2vaofBJjloWxf+mvIxYjP1Paph2J50fvPkF6PLFxVua
	 2SZZfUhDtixP7WdD5MiTNt+WNRolcETicjwl0SUw=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2A1184D1; Mon, 23 Nov 2026 08:10:33 +0800
X-QQ-mid: xmsmtpt1795392633tb9wyo0qg
Message-ID: <tencent_EB9C4DA9CDC741E0BE99F36A6871B9BADB05@qq.com>
X-QQ-XMAILINFO: OVgMLYsdica2kuw9YlcxebNwrLkqTlTuscftxkVmfoVanPi7KTjAJRloxnsawE
	 OkzUHWDIpLLH5hzIOL5HFwLFfJsiI81LqqBgHRmTr1KdMC7gAF8MJZCBz2nde0l/Rqzx22LsNe3S
	 i/FipitTETSr7VJruxVHUAEk+2bl3YmBtdEnGNEgpMnRsmps0itXCIxydnejv3R0sUIwKfrGVCGV
	 GJHN85fkoQXW2X+BDtUpQo5lhb5zb3m/2f6F7a6F3TFRkLiKFVanvCT+AE05nrz0G+LJg0dAogaM
	 oUCLu7gu4OHaI40eZR1u9AoNxWPcqtGSnR6/DqH/pbN3jndhfUjUCJN43v8Qp+T2l+MaM0F6xEPQ
	 Y25WuPqpY9ZUdxFG3RzAbrWfhR8r98I+HDNS8xiSAVZetoN8K9IGs9hUyN7jqIQJVzFdujZ8iCRy
	 zDPY8yWM6x/Df0CY9/S+b5/8P78X4cagraxasES7+nd1Wu+A18LQWYCrHj18Ah0WPFUcGkcVF+4g
	 KuCsax7INbZ8FJJTGQ48SvXGHfOXFGABUr/N+5xQZg7UUFXDNpJBIm+ONRrPyRRj0yQXyQ8EoJNS
	 3W15RhnSK3mUO0keRSk8+gzm7VtQ+X2WmyRAPQfa6lekwXx8BE9DMllVEIii2qdosQ1S+IvwL/9e
	 XdoxIKUF4eCpI1DMGSAz9ChFHLv4xtDudqefT+UWhk3TBOAuCQVfKaN3PB/f3A3tvCOLGEJPU66Y
	 f+xPzFd/LJ88yPDo66dAT+WDFYvFA1bDYYFyoR9THcBc9wneZ0BmaTGuVnwql2npNRJMyDOXQz/W
	 3R6fCTtSP6dadxdlJwATh59wVtsS+7872/NCE+xnW9IYpzTKI8gOVVXkW4MyOgoK/bBwMMKuzEyT
	 B/Yo8ok2T8y5Uq0NaKqVpp5ZwCmNHt0c2B34d8CtPy5bCzkUQnGnOobQpOUq4kl3Kk6L/II0uw3j
	 3S84qoiG5+UvoISoB7W/fdcyWGnHxtdFLLa69HloFwHY0Xl+yNToGrhw9/3FUC51gDGOlfHU/UMz
	 DnuFwV9RcW3Ss6UCwpd6OG5gx68xK/MdszeGZSc3wyfRmnMNYL3lesMnBeYO9AS6vTIYmL+Z1Xd0
	 i1Kwaig6bQOfjiM6bb3OuLIEtB+pwq4m/+qcpFIe/dB+o7MW2Q7HOl3P3lcemgBJuK6Bfz5naTwl
	 VV4cArqaEJA7B88o1ClC3K3gXD
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH v3 0/2] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 08:10:27 +0800
X-OQ-MSGID: <cover.1795366993.git.1194781887@qq.com>
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
Content-Transfer-Encoding: 8bit

The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
them as GRF gate clocks so the SAI MCLK pin direction can be controlled
through the clock framework.

This is a v3 of the earlier "rockchip,clk-out" binding/driver submission.
That one introduced a generic "rockchip,clk-out" compatible plus a
standalone driver, which is not acceptable: upstream already has generic
GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
No device tree changes are included.

v2 registered all four gates from one branch table while only the PMU GRF
was added as an auxiliary GRF.  The two system GRF gates therefore came
right after two PMU GRF gates in the same table, and
rockchip_clk_register_branches() keeps using the regmap it picked for the
previous branch when it finds no entry for a branch's grf_type, so they
ended up toggling bits of the PMU GRF.  The SAI0/SAI1 gates are now
registered from their own table, and only once the PMU GRF was really
added, so no branch table mixes two GRF types and the PMU GRF gates can
no longer fall back to the system GRF.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits were
read back from the registers to confirm that they get set.  Enabling the
SAI2/SAI3 gates sets bit 2 and bit 3 of the system GRF (0xff288004) and
leaves the PMU GRF alone.

Changes since v2:
 - register the SAI0/SAI1 gates from a separate table that is only used
   when the PMU GRF was added successfully

Changes since v1:
 - drop the rockchip,clk-out binding and driver
 - use the existing GATE_GRF support like RK3576 and RK3588 do
 - limit the series to the clock driver and the dt-bindings IDs

Xiangyu Zhu (2):
  dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
  clk: rockchip: rk3506: Register the SAI MCLK output gates

 drivers/clk/rockchip/clk-rk3506.c               | 27 +++++++++++++++++++++++++
 include/dt-bindings/clock/rockchip,rk3506-cru.h |  4 ++++
 2 files changed, 31 insertions(+)

-- 
2.47.3

