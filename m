Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285101;
	b=EFH+p98iv9/tbtvKTj22Jj3MCI8h+Nrdd8oYJACaf6es/DKaxDcAlTXsYPg6/Uo6fHUA
	 UozlGV2NEWLogQBoit6Y+lgfanhP2hlAZNgfry2+ZsVvNg/itb66gMbASrmIb3l/7D7S4
	 ShBdwP4U0d1wfueZUrseDn9y9LRK4cPTr3yZj0kkYMiCDujkSWxj+Zb6gXBGFc7ANW++J
	 6f3Bh/JyWaK/HKAZaRk6Ka7/oxfbpGnrlW1Y3g9+diPnzG2cFMWLLRB0wFWA+oxhlHjNY
	 8tZUrtVz5GGdPlFec0s5NppIWG+f70Cz1JkCM6lFJpCbpu0kl3bSamHMK8IwCE168gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285101;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ncDTKvJKW3D6IFjX5rtEEcYzOp1fkxCmtnJZ4T79BVA=;
	b=oHKTE9xaPH+Hm370FthVlc323Gpti6u6K4UEC2usyPxtRi0Wbz2wqk/nDw/Fhk7ZKVUh
	 y9xaSfvNTZi8TKhLzB72zlsBgIu8ezWWx8nN0kXGAo4ynKV7Gf8h7zTsqIDI22bH8q6ZK
	 2xfi+xGi9sQLImrW/inrbbRguVRg3NPd4f0qEuoLYk3KZpSMKuGG38/6Y6CBUuLvbQXmc
	 41K8jw2+xGc22Wao/VwPtfRqSo15ZUVe8aoMmaQRld5fJBlyACCCoCR8gEG6FF0Izoeas
	 t9NdnhoufoBN3PrTME5vwp6ERJM7Z61r4iNzZtnH6bYEirtfCxuxShsm8Sg/zt0u/0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYwOjRhA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DC606A320;
	Sat, 21 Nov 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYwOjRhA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795285101;
	b=iavaaP5Qp1Ge75RGryZ/zzC/gpFHvlKUxS+lJBLdjrHRxcojgIFlsiApi7Qp/lKt49h+
	 0lEerxxwrMSUH0+sULlMvcO8ozu5kl5ohhvCKUrQyMeaGF6umeZlc0cqWT4yM/rs9cmmD
	 1T64wxIP6q+2pxYfQNtg00OmezTPaXx7PIWg3GNo5nDOQqclLIPphkR4+R8nLUiiVzhPg
	 XAY1iH1DI62P5PnK/hSSF8n9a8cKFuhQVODueL2NEKqeSBhnUhJ1dh0fjMcFIbJ2gsu3G
	 MR+FQt28HKNuB3SHCIo28D012KCvQji6SOo4IvVewBzw3GRDub83xrfCf3LuNUBAHuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795285101;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ncDTKvJKW3D6IFjX5rtEEcYzOp1fkxCmtnJZ4T79BVA=;
	b=vjyFHM58lRN2brs6SG4MYPOsXEeV+Nm68QXpUPUgWzXtrSfzPaa1QBA9G+EKbLzgTgf0
	 OzK8Fs0nk/xw9ZpQIzB98eZXi8avUac/qmdjMgrH2f1n2kROrIrMGyy+COzmWqsoNEBQ4
	 sDwdPxPwj0tS0MNnhwJP14biMafyFLNffuS5RzEOFPpKnDbAYskVyXM7t4L14CVk9Qd8+
	 r6VctYr8UknZmb2cL8GtGhDDZIYPnKSvRVYozgB1/jQGiuAVkll2yhYh+WHGP0IUAl9nK
	 wTIjep7A1CvZN8A2t0pR5voex05S/u1pp0Zvamnd+DPEjpcMpEWlUnkbNG1VCNXdDYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AA051F000C6;
	Sat, 21 Nov 2026 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795285101;
	bh=ncDTKvJKW3D6IFjX5rtEEcYzOp1fkxCmtnJZ4T79BVA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PYwOjRhAmlC7m7EdHMGijlL4hwflhtO6Mux3eDuzIhcKjzsQ3WIVOxHwy/qgY55Ht
	 z7LLXbZ1/ja07cBgZsbkvJfuKAnpwtJc56TJpcjN19MtF8aW9GtjZbXIrsfznZpuTO
	 rNKnGvgegfj4QemmwkRLQq53DoRdU3OlMR0RPz91xuLLVYDDpfxe7wa5FdbDbSHbtQ
	 H8fOQQADKF8207ZHgUaXLjAMUTggdjkwwoyJPj1tflqPDgGNp3pI1Js+15a3swX+5k
	 ja3K4JjdHluT2PGCN9NCiAI9GHOfNjQEoGneevMxz3noNCbYKOpEroqTDJC2tVmrcv
	 JFf5jREWmfR+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D585F4BD38;
	Sat, 21 Nov 2026 18:18:19 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH v2 0/2] clk: sophgo: sg2042: Keep gates used by firmware
 enabled
Date: Sun, 22 Nov 2026 02:18:03 +0800
Message-Id: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2SV0LQqe/A/DoZQV1gOYbiUaw
 r9b8O7xZWbeLKAchBUu2QKBZ1GZxgR0yMAPbuwZpUsMVNDJGDLYWtSeCkvId8EQPbLtSiIqzdE
 xpN0zpOS9O2/Nj/XVPtjHTbQ1BtE4hc9+Oput988/GyzQ1FVdtZXrbH2+inqnufO5H6FZ1/ULo
 QssGcYAAAA=
X-Change-ID: 20261121-b4-sg2042-efi-rtc-e4d5222513ae
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795285099; l=2101;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=JKiIHEduS5hiyWa/DdSePRqv7K8ib23Oio2mSrLYzzE=;
 b=XWWBF8jXOUX1HUf4l5WASPoIi5NGWrSK+caiEitu8JsDdG/2CvTfkI2bnU89QdZszlgeJapa8
 IJlfO1uGxpxBmw3X+sg0e100TBClDGnH9+QrWivGNSMX6UySEyjD9ab
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

On Milk-V Pioneer, firmware uses I2C0 for the EFI RTC and the serial
flash for its own image and EFI variables. Both sit behind clock gates
shared with devices Linux drives, so runtime PM on the Linux side can
turn them off under the firmware, and GetTime() returns EFI_NOT_READY.

Let firmware list such gates in protected-clocks on the clkgen node,
and keep them enabled.

qcom, the only current user of protected-clocks, does not register such
clocks at all. That would break the I2C controllers Linux uses, as the
DesignWare driver needs the clock rate, so here they stay registered and
are only kept on. I'm not sure this fits the intended use; suggestions
welcome.

Tested on Milk-V Pioneer.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Changes in v2:
- Drop the EFI MMIO patch, Ard is taking it through the EFI tree
- Use protected-clocks instead of scanning reserved nodes under /soc
  (Krzysztof)
- Document protected-clocks in the binding
- Link to v1: https://patch.msgid.link/20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn

To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen Wang <chen.wang@linux.dev>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: sophgo@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Han Gao (2):
      dt-bindings: clock: sophgo: Allow protected gate clocks on SG2042
      clk: sophgo: Keep SG2042 gates listed in protected-clocks enabled

 .../devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml  |  2 ++
 drivers/clk/sophgo/clk-sg2042-clkgen.c                   | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-b4-sg2042-efi-rtc-e4d5222513ae

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


