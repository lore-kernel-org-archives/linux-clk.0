Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181135;
	b=oft6MdbSyt9yDLwadDEknAjKbcSUtmIGpBLW3TJF0wWnYt3P5BRym1O5mgCQZGZXqN4q
	 sIiUg7tU9zXCBkIbf8Us2SjR95KorAS8RX+tHBFzRKIDnvpUDUDSdnMMS49XIgVUkc8Cd
	 2Tx0hmUQaJRruueeM/Ufhs5d+uy3ygRYjThzcPkTUK3AZ54eoEpPXJkZ/+TwmbYR3MV+6
	 mj+QtrREA3X4b0/8rjKPxEuucJMOZRYPSPxd5orwLEQ5wJQp/XEg9xV91khDvVpjQaO8E
	 8Ij32tItUhr8gkAiWq4svQiOmDzilF+MaDnP5gnQu+G6sGQPWl/FQi0ncCy3DSlZLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
	b=FZ7nd+CTz2HmmE5V6MYOJe81T+M7rnoMolkxGfZgBG4Z3Qamwyp7R4Vsi9GUgKcQJ3Lk
	 Orlqka8WP/MnaoiLBbZTMbsxtWNqpyZShMglP3sc/LP963lOjt4k7QaoJ3CTfXzjCR9R9
	 s/JuTg5jRBkFhcAOqRAA1Gnc/pFrr+gTiI0O642tzWzDvf/WDxderHNS+z90091xgQOP9
	 3tKtCLaShlGaT+JGAJaxzlrAmeCvVeBTfUCbkx7b2fZ9vU6SHfC8SXbYLQao8RigPZ7gC
	 1lxdvWEiRW+YJtdPL9kJIXnQ9NIRVwR0WXUz/ETpgA/6FEssxPPswjCkADQSiGaIKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o8lMw/aM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831A606A325
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2831A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o8lMw/aM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9Po1667702
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IfDKzNsgAHeLY6I7naXl/T
	i8gw1wunbFLanBQnyLppA=; b=o8lMw/aMs1SPxXVNchecSlFSlZ42GWcqNlQyPH
	hwJrPI5O1kaHSbYpH0sUcnQcYyNW2hHL+4jnV7q4dkHEEsFXXOYgzfeNx78u2ILj
	aMYhggByYTWkLMKfcnw/GKtzhztPfHShz4yv+pwLHP6zAWBYV6mk9H/DtaGM6o7J
	xhteXrBCIiGz9d50rZmh6BxP2zW1i1e0+c0sNSkpcnWZ7zFcd4WhDg2Mqz2dHYRb
	a7INfbG/iIX9VYaND3IV27iA4QOVbQ6CEry/u2Q4ACDg5R7Wb2QAC3pVm47pM3Ni
	2/ZdwboAfxfxxZ7K3ck0C8V2n1Eu2pDgmpezi54daDptvqiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptyje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so1836785a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181132; x=1793785932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=RJRRgqg8JAcll22pYb5ZJ9xWecZrl4OBsPAb+sz5SLdk7kF0WmKjawYgCctPCN/jIU
         3LZqsP+D6dKLsY60JJ+CkgHDOJgvkpMHrWOHey7iBH26d1BBXdRsG4GXs6vCA9eb3BE1
         dBM2fQVocBe0gJcq4dp4lBA7BkJ8xJhujT4VSAtHl3Fn3iHCWuP1E4oqTWt4iwoOS1/Q
         X+ZzzrZPkfTc2mvnvrHbEy8U7zSWhWZVsp4eE+yQ41HBTL2XKoUUQ0imwyz4sgxQD56U
         xusume097vSguyTUamjEcioWdYqkx1CMVxPKvf/ZGORatNqNCPulzU9ClDU9WlWHfcO7
         gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181132; x=1793785932;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=e2xdl1npCDSv5TAwyhvOqknghiKBu9M0iO+O22nVNxufcEmvsgnO/AgsbbNM3OMNJf
         aTZ3lh5g54TadrqbURerGYUggKuXEyLvSKUsDc7Ep8iuTO2t9FLjIt6Fetor8ParykKi
         xtQBaJuDgKsOXdmXAsPQ7xj9e92Gf50uu6rzDZZbEil8/BZKuZC2A3+lkaL2W8d9Ahlb
         iXDW0m8bh5NODx64Q7RXBURKFKLVox9fDsGkE1WCDTk83cUICnUbWxwtrcbdvEk+1I6c
         Gop+eZNQ1BwuLyJnbe7uMXCFjujbZG608l0rPYh4zTyI65A62+U/7Mbofe5kYL/HfNaB
         mTKg==
X-Gm-Message-State: AFq9FYIXk3N+/Dl22qf5SBp4cX/k1hDHbfWxFrFsQOqc2EwSo0ebJ3ru
	WmPNMnEYll2ybWTfjjJBo4cTQusJL2w9pgrRfU9GsiSsDbiL8PUOPRFyDCyTR3gjChLEMFOEFWS
	+W5ggNKUEOwhQTYwi8Wi4TbuJMAf2uEzY5U2LSP+qPhLdDv0ZGXLx6W/0dlJ8y9Y=
X-Gm-Gg: AYBFou0WYusarihUd8RiPgyG5wKzNJmhCdrkzHKuEbGXd5mmOnB0W3NJNPTouHwdvkI
	hHJSfWHKsXPX7sN5EL2Ljufd7IyPrjbg+My6CPg5eKCnZQsI8sIUVRh7ICx9qbZ8q+EwHSlj7X4
	ohHAcRMm5wvadowXEuF8aalcmbFfJtQtKozVP1KzRGPJ+sI3Ce7sRt+So/ygM5KExBWnHTF/6U6
	TExUe1GUPLn1s8HIaMQDe5xNXCJf3X6PnJLjriwCych7obpQj2k9OHgtvC8iIevnLoTSfncfo+n
	qcTqHTgnn4i7CFGCUqLJXoFz3/JmRLFY+6bunfc2eEPiKLOUQ4OvWyKxLPAgy87O9iAQQVRWzg2
	Xs7ipD7U+66EO9blPnSGPDzudfi7T4tDVAaC8KmSQ1MHkIljNOnzula3oEDg=
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892403885a.24.1793181132248;
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892399585a.24.1793181131501;
        Wed, 28 Oct 2026 02:52:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] clk: Restore the clocks of a provider after a
 hibernation
Date: Wed, 28 Oct 2026 11:52:03 +0200
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMPF4WoC/yWNQQrCMBBFr1Jm7UATq4JbwQO4FRdJOmNHJS0zU
 YTSuxt1+R7892cwUiGDfTOD0ktMxlzBrRpIQ8hXQukrg2/91rV+jbHD9LijkpVRCQMXUhwkkuZ
 Q6hh3HTO7nsKGPdTMpMTy/l2c4XQ8wOUv7RlvlMo3DsvyAX4bTEeJAAAA
X-Change-ID: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w3jz68RcqMoy8uBJpAr2vq/NID/jlj1n+38Cjr6e8wM=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGrhxcajhPRtnl1/P5MpMKjmO3wAHx5nIclRP9Qb42we8Rrlr
 YkCMgQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJq4cXGAAoJEBtfRMkAlRVWk9EP+IFt
 h4alqJRTEr965fdzj2YzwsdsX3SVxZYw3KmWbKdsZigTS1ySR5J7dYXE+BgeNV+uTYQzUFrmhEO
 B/w25Z6I/slmPJy8WFfBzPssY7i12jKR/hukbD9/hdd9j83CkXTrUo7IEBT0VH8Xxwo+3VPSAbw
 yiPBAzNu6cIWiwcmkhm63v7gygYQoD8kYNGlI7ODjLpSRfVQv3KCs1KQmXcYrpuXZ6JxRkcLywK
 UKcG4Qs6GT3GVvnt+c6qu4QjyZ9899Nx+zExyFuv7QzxlAz+p09W74kkgdlp1DRjfEzNdI2zsZO
 NknRQI0ZGK2vGOi3P5hXpgyHgkMyZPcAw3uzzmuo+USDinqeXTa+PwZqDcNIpfJUEF7z93RN06s
 5YaR2lrxoSe2M4apKmPRFBdxLGHlbQodq0v3qy5fumkOYuc+DQc5bZUls3DipGkJKRckB17iVbZ
 ni9IXE43ySAAUp2jECfaa0gR+GHEQHQ44UZ4mUzBBwhJooo6W5hsXPrVc496sMKH37wg1cdkfR7
 h6KvcwsbzRjiIi0KnYwOis7DNRLkV7UhpkAJu5Es8OWh96ZIkU1UM4qnTG2T8XaMg4h1Dmrb2aC
 kn0qzndII7d3fkjPz+gSWFs+Q8oLmVs69biJMe++R2M1rzbEyoZ3fnPz75UwrrXOAfGSkPF9Uz6
 ImkM=
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 3ctrLKbU-S-uJbiLJd2c-OzMzhNr7VOG
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c5cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=mQFjCgyIq3-au8Xv:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ktzcv0D_gfG26edE9_0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX2l50eB1H79Gb
 OL1NVsSZU1z1hAcKqtfSpOYP421X0xpF48Jr91zUGdrLgrG/JUX96bWXjjQOy9X6J0yXsnk6416
 jzBbDO2aV7Dt/kGU3wbAzvkIgDBvZ00Js+FQgcuqBUC4ko1xUZiiIvlSD+0syDNSUNIEqvHqivK
 tWKYfSbV9lIDgX4PBYMTKIAlzdqeA+i9g5KxhnsddRp7sns7OtbNT3tnspxLt9ndOueZhfrGiG/
 02dokH5sZrIQP8JfckMtuSxmsOISHBD96NfeCUY7ElxHdY3sapo1abkxCRJD+7fG1DV/cUoWq+d
 lVa09blX3V/vICQTi5zR0qpjVZYIfzp8bOx/IPN9I9K96fDk/+CI3bNsctkjWqNxb+CMZFKdtqw
 Ec5rYsAHmSAdqbDmsoQTSmoVSSY3PPfYWnKXPlMPDWuZcSWwv8e0ApH/6P9mrQAaX22m+9p1QYG
 Tpol+ZudzhwjFKY5CiA==
X-Proofpoint-GUID: 3ctrLKbU-S-uJbiLJd2c-OzMzhNr7VOG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX8xn7Y4HbN3lV
 aXVDwqC9k9T1/9Q1i3kQF8a8iXSflciSusI61buCsPtNs9jWXe+hP8rB8ehOdz9TbngrYym2RDb
 QbESbSnub4PBl/bPi5tD7DpVp3e2CJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the clock hardware has been through
a power cycle and a boot kernel, while the clock framework in the image
still holds the rates, parents and enable state the consumers asked for
before the image was created. The consumers ask for the same rates again
when they resume, the framework sees no change, and the clocks the boot
kernel did not touch keep whatever the boot firmware left in them.

Whether the kernel that loads the image probed a given controller at
all depends on whether its driver is built in or available from the
initramfs. On the Qualcomm Glymur CRD, the display clock controller
driver is a module that it does not probe, so after the restore the DPU
runs at the 333MHz the firmware configured the PLL for instead of the
717MHz the framework believes it runs at, underflows, and the panel
shows a solid blue screen.

The first patch adds clk_restore_context_dev(), which re-applies the
cached state of the clocks registered by a provider device, parents
first, as an alternative to the global clk_restore_context() that
depends on every clock implementing the restore_context operation. The
second one adds a hibernation restore callback to the Qualcomm clock
controller common code, which redoes the probe time configuration and
restores the clocks, and the third one uses it for the Glymur display
clock controller.

Sent as RFC, as the same applies to every clock controller and I would
like to know whether this is the right level to handle it at before
wiring up the rest. In particular:

- Instead of programming the cached state into the hardware, the
  framework could read the parents and rates back from the hardware
  after the restore, so that the consumers asking for the same rates
  again go through the normal clk_set_rate() path. Would that be
  preferred?

- Programming the cached rate of a clock that is not enabled may not
  work on every clock type, for example on an RCG whose source is off.

- The Qualcomm callback finds its state through devres, which only
  covers drivers that call qcom_cc_really_probe() once per device.

Clocks left enabled by the firmware but not by the framework stay
enabled, and the phase and duty cycle are not restored.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: Add a way to restore the clocks of a provider after a power cycle
      clk: qcom: common: Restore the clock controller after hibernation
      clk: qcom: dispcc-glymur: Restore the clocks after hibernation

 drivers/clk/clk.c                | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c        | 52 +++++++++++++++++++++++++++++-
 drivers/clk/qcom/common.h        |  2 ++
 drivers/clk/qcom/dispcc-glymur.c |  2 ++
 include/linux/clk-provider.h     |  2 ++
 5 files changed, 125 insertions(+), 1 deletion(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2

Best regards,
--  

Abel

