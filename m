Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346440;
	b=Eg86l3BQTOKy84kJCEYLcOKHqgtd9U1FEqwPQrdKvZOZyaN4hRhrq026dUpogzyNZsnd
	 njRSiEhknAJaU32wNzTjfcE0NZ16ck+TPCMaff3Un1AhRY8QhXuTq5P1yqNpCAnAf2cM0
	 n1NuarObNupDQ0QoR/MqVvN/Bvif6XOcuLoXchhjw1Eq2RCNCy4xevWFwPyFmE5TZYjBw
	 rhF9QHsd8QaY3G5hZUXaGedWDcgYOra1z0/gCXkbqqvoHivvB3Rej8vsTNbjiC8Yir/oh
	 zlpuPy7P7zBMOESeGJxF+3lKZyRhbTV0vlBPjsL4czbHtFUL7vKb5DUV/2ihUBd47mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
	b=bLGfgSYzLB8uAVkEfymnLyXzAD1qPE2IUbHGhKOIEfYpdS/hc+CF3VgcWZV1I5OJcb/S
	 rGE9CK8xJEcJQQork7RMA7KBprlzjHlZvWwbUcnM5wpCrSFCkgXmmgFc1K/vda1yNnPHX
	 6kxcmys7V29jAbuzVukGRuDVy+cBETz6pALRS7nW2gz1cSPDvlMT/s6aX3OmUoFVSovzH
	 +u/KcJITglJxKnEs2AojroNsF5JIqlsZP+9kuCOMAZFRQV+9u8qKbxHC+iPos/aYxi8oJ
	 SnJz6v+ElyDbjb/sAOS8M8PWq0IaikY3/5dJ2ZenhD7sfnXrtYSlF5mSNgFWYbnrEGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRNyz5pt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C6606A320
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 21:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRNyz5pt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1498396f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 13:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346438; x=1794951238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
        b=JRNyz5ptAat4iX7nzgsEYlOCVAnN4M8ukPGdG0cd37vhJqxuGvgNE2KussBUEmA2hF
         h6UBdsWXv3LzWwXZ5IawaMTIoE4RLNPsszpLdKSeOFgXD96DN2vpHMqu7cv0paL6aQ/5
         KRF6x408Vkhz4mbTkJs+a3Z697oL1CNAmZbKfu2AlwzAvDnJgqVVas3yxmyCFhLYpbkp
         S5YniNA4nA/cvG9D3WmZMHacu1a0TXpXuM+mR8+1opPERZIFIJ/ji6B8Vctr4P3DBD5d
         4+VMTY/hgia7mBtJL/SOy5SrJRqC4xA/+OXyHHszPymBGIYQZsOKoVAn85vriEPoF7AE
         HLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346438; x=1794951238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
        b=zdEclFwnXb6uTcaYZdq3d/xtkEoVIVu3A3XeuswYInqvzTvsZ7kWf5V6El4A6ajVOf
         45bu61lB0usohWIgq639ggdKdHoFr5w0UXLJ6C76XHxkk/kNMFCx0XAuuDDykYi40dEc
         G4WUgtHus847kwTHh3TP00qNlaVOnbFClCfU5B7D52iAn+vGMNAQqZuQ3eTQNe8RTqlW
         yw+kZxZvKwwsP1M79RFEkYUu/YF2J8z/PRQ/zMtEpjurVF/k2OEx7OD11FXkB0pC1xZp
         LChQtUHUb060/Fv+5O+9w090rNj4mHz4nawy0so86GrsThyE/sIlDA/uVK0TiMLg40LI
         +B8Q==
X-Forwarded-Encrypted: i=1; AL+hErEgiQHIZA6hu4jHArOFsMmzELWVB65V7rzgyNP8I4nZ7+QBKhkS1vouU59eha+RH5Ep3g+2akZnrVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WGSLi1IM4e0319B9j6euYhwNuLi7cVEPKMi4HA2L0HnlffjmH
	yNVFtfIteRVPFdWWfY8pQlju8pcC8r1iz+qMjUK0otfhxc/hDastdvhp
X-Gm-Gg: AYBFou1fLoc4ZYi7eVhBAWK55QVrMbJ6brU6Y+u5snDSRxeVccvma/OZALnqz76Nkbd
	+8v5A43ZtVu7Qj7IKDQGZ5eWEGAvKshcp1c+Gtej2nysx/erG0Vxv922Q/3Av+ip1otLamRLsrI
	WjDkAxP15S03z3QR/Rwaz2uvewYDnHbF9aMiT7YFuwUz9j0OzNu15LdlkZgIp+zPf+sd5Hpdzq4
	rQu9C7V/lsk/Fkp8+XDx1YLt8HmmCZrOd0cHXmm57nGbV4TRQgMi+6BbnJ8AgxmXjChBcGZHXDl
	QVHr7YtEQLgVGTbcRzaK74zT6BXSBbImZPc/5du4zki3In8OgGb7DmzR/FksI0Frw2MPYPyGaeE
	X2OuVKzn+WenE5fnlxiHjWNFOqdfzkLvWI9ahsWtJmKl2ZwP7FCDOM8Wz+hbc+o/ehQOHaIECtt
	c+EnI0SYFGGtQ5msYnqfkwceFsQNUB018iTgnLGmK7CZy7JtF3OE6Az1J0apruCSiOdF+2NSR+7
	aYgSKD3B/kqSDbbBGKrRGi17XcRIM2wql3YEzlUvxqhajbZYFhY0YFOiQP0WzL647mhiU0/DSOo
	ZONFTmJlfQSfwJE07rbhme3odQ1jnKGAAF7fose82ZcDgr+9xhUH2UMqsjQXdguZYF1SMvc3vA6
	B
X-Received: by 2002:a05:6000:240a:b0:492:820d:1e with SMTP id ffacd0b85a97d-499c7552585mr356605f8f.11.1794346438211;
        Tue, 10 Nov 2026 13:33:58 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm6675504f8f.30.2026.11.10.13.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:33:57 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] clk: qcom: gcc-sm8750: Use retention for USB power domains
Date: Tue, 10 Nov 2026 23:33:46 +0200
Message-ID: <20261110213346.1359-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

The USB controller does not expect to lose its state in system suspend.
The controller node is a wakeup source, so in host mode dwc3 keeps the
core initialized across suspend, while genpd still powers the USB GDSCs
off. With a USB stick on the port, the xHCI comes back from s2idle with
an SMMU fault and is given up:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
  xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
  xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
  xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.3.auto: HC died; cleaning up

After that the port is dead in device mode as well, until a reboot.

Keep the controller and PHY GDSCs in retention, as SM8650 and X1E80100
do.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Tested on OnePlus Pad 3 (SM8750; the board DT is not upstream yet),
v7.3-rc5 plus board patches, 150 s of s2idle ended by an RTC alarm,
with a USB stick on the Type-C port in host mode:

                                    without    with this patch
  stick left in during suspend      1/1 died   2/2 fine
  stick unplugged during suspend    2/2 died   3/3 fine

Two more 25 s cycles with the stick left in were fine with the patch.

Without the patch and with power/wakeup of the controller set to
"disabled" (one boot, two 25 s cycles) the first resume still hit the
SMMU fault and "Host System Error" and lost the stick; the second one
ended in "xHC error in resume, USBSTS 0x101d, Reinit" and the stick
came back.

Device mode (NCM gadget) suspends and resumes with the patch as it
did without it. I did not measure the suspend current.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 80b8ec119c55..080f2fde53a1 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -2940,7 +2940,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2952,7 +2952,7 @@ static struct gdsc gcc_usb3_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.43.0

