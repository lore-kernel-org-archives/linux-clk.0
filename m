Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550522;
	b=l8pPzG5mT5Sa4Gv3k+s1CD7b8K9Trlz0QVuesPhGNKmQ8751urrA4nC32sRtGP4F8w1V
	 0jFl+LrZ6K/vczuysnHmtojfZ6sv/qUP5yYJvfLjFT2GPa5zHtS2CupJY/acKFHBfnHlV
	 IxbMIPfmSDXkxYv1cZTdy8WtU7jDiNLYHZxx/HjvAKro4wkXVAAqfspilMFUW9fkEUCZm
	 GskxjPrSbRD8qQIvzj/gk0c7j4eqL1AgnkKy2mcXOgyB6K7M+rz6G94I0GkhwWQY7I9jO
	 f1zmWKUWX93R0K0YfmndM5RRSs/jZhNCvQO/jdEJSNmLohAMJgoAH7qMn5DeWsyDdpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
	b=l5M1Z0PBvaJd4v2exJ4v41QAlNYEqsP2sWhJgA/6NJDUrKH7MlabkwPwGboiId9ALk1f
	 vJnL7HHhigJ22wDLU8zoucX5ooB7WWXMlz0Og93oQU8baNRx84k6OSag0tk91S34LYQK8
	 x5QAUrKczL0DgLB4EnTIxv7aRicpIWkdPOb2qqvoPIKtORyFldyeZaF5csIGniQ1qAGGT
	 +hkYYmp7uRIDjoM7VM1gAgyjSPAua69EvtKpAaae7EiH2CayeHzXE3gi+Al9y1chSXWB0
	 bfVKptYFYvwYvS+rHIzm8Ko8vP2VRy+XfDi25R7pHW/+g2ljsu7YqbyFDZ1q+tZpvpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA0606A681
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCAA0606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXR6N119663
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=; b=QJiHHMlDzapIWdkw
	3kJBFanukFtywHVqWJkFZ8pMzcNzIiD8OlVllzDuXcCLoVGTTO+vqk/dJn8Nz4Ca
	lAUrqD988I2rWLzgC0fQwmIL3CtgbUDBqE7bjsADOMw+9ufRud2+dIvtdFfFaUe/
	5fUM3Na69D53s57yqMSK9PabCUey/cxL1HRwXsRyBhkUtM90A5v2wuMMFAQRO0EH
	ofPAj1x7CKqwoFAfQhsjjQLXudHvuP5L8QBXDLzq1ixCtkUZNSnJ9VCwiUIESc+O
	a/hj3/hcxFh4+3kyFhTP1dS/aHlc7oN8fkGMAK+WHGhxHLmfXezpDAb9boq4Ac8x
	5eTELw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effrv3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94965dfec53so58233485a.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550520; x=1796155320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=KQXtfLVgSRuiGkrIyJo4CKUwXkPU5l0IQaM2NEHzCOk35bWWnBZV/7bMcxfjDSiBJx
         ZGGRZxB+SAKAo8nEfYXkMn2nl34WN6fSgIdCApyXxX0nQEkF9rZvC+ck7dVyiEuzNV/2
         ksv5lATugpXgthF3GsTleHzhEli3v1edeE6LPIDEPisXfloOffiTuN3e3WMObPUrX9GK
         GmtcwuI0Ymwc8vn7aoHTOr/eKrvBrV7Dlyu/VKnuZcn5hMceHQH6rfpZZLmM3ShjlFc3
         3QEYeklw03DkS1rectwdnUCE0dEDVMAXz3T+Utj3sL3MJKkJETjYckVZElC+S+NSMpFc
         ruKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550520; x=1796155320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=KDovcYNhnuuJzfcKlKcKeKJF1L3SBLd+KysytHBSAkKycGTIMEPFYzAlegkbqTij6K
         CKmnYuNLifxG/bfXZRR5UgiSs63MGtDoxRGoH1QgmTdfJHx8iyneKdgGWxB3aR1cewVL
         azVIxPpz57aI30zfTA4s1elnR7x6VpFaKTcUch1ML4YBlG/Rz1NE2VT/qoTevBegs2hN
         cMVqMDQRcTLjdy8KLEumWVR43isW4hNNG7kpLb3/bbfYKgYoakKKtklQluqziP0S9fU7
         9brcWl/zFjc/vb4m43gv4v8okkY/5b+6jrBepKOVTSzwohWBhFo4lb1JGzYOkw/NlNEp
         Pmyw==
X-Forwarded-Encrypted: i=1; AL+hErH6ZF2vS+rarM+vsLsRHau6W+cuXDPqSmVlVsUjBVRqUTZKdYMt6YPUyjbOMf/iBKyH74Do6kI08B0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n70jLoYGib3ZrXxqFPHzB4BuLRQdJXBQapgXy9cMm+oLXEvBE
	pZrud5VTn6v7rLx/K2Atx66HuQpHAM5xkaAf+1Kmpr1IaOSAwdE1CLGrcA3MrgesVnZExJGrO+r
	cf5fZ31kasFVjFqGwsrR0p+RG8BLJ4M2y132ZBN4Dblqsq288bvXhZmP8VglvNio=
X-Gm-Gg: AZFdTZcpwamgoRfrcZcKI3C0++xse0sXG1wSEJXRYOfxK5MdVjjN/FrXPSTJ6HCB2Em
	mgVMuUvE2OGwgmBe4FNwQcQnzzile7T1D6XBTifMs5y3MbDHcU4TRwswxJ3Z+oBXjOGAcOb2A7V
	lgPkeo+u06M+CuKBCOfrAEz1Ln4MGY/Gsc/hrmnUT5dKhBozLexLYHZzOkAfrNnXkOiHeIh+4uv
	ilIjIpuyGJT1jWaqoYmJf73zKxxUL6iRakpbFc9yzj9fYfd0W7Y0xzIrYzEoplRmuAU4UTW8vWH
	qr0UBzS6uK3gN7CX86MILywkG3iSEO+hnHl/mB4bOI0NIUWFhHfeC9sKLy6GqTEBkGpKB/uDvpE
	OkGrQqp63WzbHqPjsKzoDyN1qlJII7D+5gWIaH2oElYxOA78JjOcvqjc6bdaag/K7ai/CMdhB4V
	Pkog4P310=
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854462185a.4.1795550519955;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854455985a.4.1795550519390;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:35 +0100
Subject: [PATCH RFC DNM 06/15] thunderbolt: nhi: Clear ring interrupts when
 not using MSI-X
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-6-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1901;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=lQhH7OQzf9VgDsH8cpaKlHzic9O9I/E7X1/iq/ZRsf8=;
 b=itTnkK6xsIu1DWfmtZAk3+81tKnNczIoJxWhHQHf6wPBNR28LsV83Y7ssCJJRB4lEvbsjUlxZ
 PRvOcCK/TYtBA4xVMS7KVxT/taKfbc2x3oexd1gRRm50KBZuP2nBW3X
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b05ed38 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3EEjJ5KKZ7fs_CpJeu0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6zE+c9ozho7I
 qeu0bduk5qW3HdkZEZZMG/T9wUneTMK2YOHuWZSXfA+XjIr5dxf8Eo9wZA2QR9frZmmRQia5vuO
 J3u8uDhajSmZiYgxDroStMJ8hgB8GsgLjF/N5FY8GLoSlpYs4Yc5PgKFWNJ4FXGRtLrDFa68bGI
 VdCE+aKPWpy6gT4RgsQ8/7X+v9t8pwxy+6qoKnlN0cD7N4hu63k15S9aisj5W+hDOmdLObBgGfe
 7iqt4Ypy1B13XWnyUaC3ZJ2ob0Rlvygtq2xFyei54pxEnA1A3VpDlGdV2I42ogZ0axW+3td2RJU
 FlOz0GpOx3MCoaMcYGdpYpwWEo6zcTnvesyZ2kLqzX0cC5RfCugZlyFpX4SD2C6VFRpwXHef3/K
 XZxsFYPrMNUU21wCO3XD/FdKd/u1EjMW962eccF2di9x1CM62vKnw/YeAawokAHh41lESiERkhU
 SIQHEVFXoP1TiVCn0Kg==
X-Proofpoint-GUID: FZa6MmaYSTPK095UQROm59PfgJyHfkSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7bUsyVq1jLag
 TbvePRDuN/EUdow4GbSfKVTFw6xFJSrP22CN21RErWAcXSOT5T6CjrPwmBwfDzceL2W0K5ZiQ+D
 q9nsp74Q1Jj1q9maJj21N9yrByZ3hBo=
X-Proofpoint-ORIG-GUID: FZa6MmaYSTPK095UQROm59PfgJyHfkSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Commit 468c49f44759 ("thunderbolt: Disable interrupt auto clear for
rings") made the hardware stop clearing the ring interrupt status on
read for all routers except Intel ones, and added an explicit write to
REG_RING_INT_CLEAR to the MSI-X handler. The single-interrupt handler
was not updated though, so for such routers the status bits are never
cleared and the interrupt keeps firing.

Write back the bits that were found set in each notify register to
REG_RING_INT_CLEAR, before handling the rings that they belong to.

Fixes: 468c49f44759 ("thunderbolt: Disable interrupt auto clear for rings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189cf424d04a9ec48576efe78283a83138..e48521482c021c7f5f73349ce16519d6088d3250 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1036,13 +1036,20 @@ void nhi_interrupt_work(struct work_struct *work)
 	/*
 	 * Starting at REG_RING_NOTIFY_BASE there are three status bitfields
 	 * (TX, RX, RX overflow). We iterate over the bits and read a new
-	 * dwords as required. The registers are cleared on read.
+	 * dwords as required. The registers are cleared on read, unless
+	 * auto-clear is disabled, in which case the bits that were set have
+	 * to be written back to REG_RING_INT_CLEAR.
 	 */
 	for (bit = 0; bit < 3 * nhi->hop_count; bit++) {
-		if (bit % 32 == 0)
+		if (bit % 32 == 0) {
 			value = ioread32(nhi->iobase
 					 + REG_RING_NOTIFY_BASE
 					 + 4 * (bit / 32));
+			if (!(nhi->quirks & QUIRK_AUTO_CLEAR_INT))
+				iowrite32(value, nhi->iobase
+					  + REG_RING_INT_CLEAR
+					  + 4 * (bit / 32));
+		}
 		if (++hop == nhi->hop_count) {
 			hop = 0;
 			type++;

-- 
2.55.0

