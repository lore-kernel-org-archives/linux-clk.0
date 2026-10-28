Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181135;
	b=Q9Y8LKauWSctANGnVuKMR8c2XvOSaanCCG8nBmd/XK3UPAEkk69XflG+6palB3vCeRz8
	 AbX+WZZSAFKRjXa0jBBsgtmvBxCOIY5OXYQWI8i+hfNzutyIQQez9LsyVbH6b16F3IUmf
	 5VyUFik0nPoLlw4HrBfOKR10eW9oKg3ueGHj7HxSjX6Eq0v9RZYgYbaTEmd9fxNONb+RP
	 Iqup+LqFNXMs6ZtA1VadZMEznMRLUn6wbzEy3LaQxsr2iUTv4773G4o1eDAnKstr02/2l
	 p5Ia7d6ienO0ZP1pbKt8HxKzXO69FT/wvOgj1cca90f4Yz6gAvqzYzG/iJ/cKJLsU8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
	b=h69WCbELfIlUqNb5+47wiLpnIykmeVLhB9uF9kzod5sFeYms4F7vH3kTytDgsBtXdMyK
	 dGw7NMsAKTpGAHDAuSLrJCMXAFZGL0mCsQ4BhSWVp3L1LMGSLwhdAgbZlwe5Jc7kNN6zl
	 wb2CZcVBSm3deeBPpJNfwgw61VdXP+aqB2fY2SEslIJvWKEX+qEfxle+PN3nKN/Oh1H/1
	 CciqcmSrCPU0t9oQyk/zv7Nx7UERhUa/e3cl1Vib4BLGDC2tRLAYKnpLYa+X0EXQsL15G
	 wl6f5pfOKYowkUp2kstQuuPElX9SsK1ib4Ti/h94Ac3QNYMMCr76IrhIMgHhPRnGQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81127606A330
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81127606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9Z41642908
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=; b=BPspIupcSsvi9haB
	HEmX2Rdz2Wh7xh2QeYMqT0HYM2hqzT4OH9tW9+7+TqdTcjD93Y0VYYax0/0CH29p
	8lCF832cadaNYTkohSy/P36xpKZJJ6zs2uIuUT2NG8TkpNiNxbew91I3fDUd2xc+
	kpyQz64yewtWn65MARq4/AYYfQaAQTMOGGu9PcggPgtIWNGjr54sQhQLC5jwbu+4
	6txX5VmEGSfX+XTKkGl2KssdLuc89vmILik5k4TVM5kOHxBnWdLonITJwWgDCqsr
	cNjxU0lvXGbuqbkm3M61azBVcLLZmLESPD8GWVBlcBe+ri67DkeZEB920Q0YHmYw
	OyH0yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpudmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so154569185a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181134; x=1793785934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=V1DW7NLWm10Jvk03QQ/3RvAhA5pPeFNGHqO9wsTSfM/Tatrqzn+/oQ9fMiimb6mPeN
         +O/Oau3qdQgRmxd4QROowpwxnxwInb+Wr/JTvR5hMwVm/7p7GTRutwOX/z2lqWIzfMu8
         GHJgbVgZHMLx7SO38fKE99NWST3H/DeDlENttq4oL1XIIPMAbo3GfKawKHAQ3Ye0VZLr
         fX8oXamk4HcZdMsEfsoN4lRLHQ3WFY1h+OIM63fNp3e6f1Ldei2hVEOPZ0apdKeg5e35
         DzmD3Xd3ebvOO8yFH3BmuECKlYeR1JY4P5h0TNfRSmB72Q3x+ZAmIi8MbmE2F7jHuXbU
         hFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181134; x=1793785934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=oA25cDP9OlWcuqPjMXtkSR9Fy2oDtMGhKy7Ev5mHraeTo7xPiMfanWE4RaKJcLX+RN
         HpJavpftUkLAdDeeXDwW855Q1rxXTZNlJGklFuHgX+nD+Kz+jlma1j6xtcmDBpOeQ/2t
         dNOdtEg+AvUvMgw//h61pjuCqlzHVb9Pkcfk/PCU/OZzv09W220GIA+6qHCkfwj1X+Qk
         7e0HVdRIJ1U6k7zlkF5YMOghs6PM7ZS8DfrDT1sfT84KwfOB80+z4P1CBPw9xLvOEPz0
         pwB2pbo1tNeuh1FDCMdD/wIISj/lBNGjIN8r1RXLAFXm3fn4GNVMf10EIC7SJ9SnJVgH
         d6PQ==
X-Gm-Message-State: AFq9FYKR4GNNmlOqu6GkLvaH2PEabwO5+Z4IG4ZEWU148tnb1Da71gRU
	Ja/OKyd8BmUVu+HMnPNkbemweO7QRVVUGy6nGe8iw03QL0NOrrvPjpnfL8UZcgz17M+cWn55yCl
	Y6lkdFt38uIpdIwUJoC6rs5O47lB3vUFP/HqzID47fHDZ4aUacUZmEAgy9hLR1rw=
X-Gm-Gg: AYBFou3jTkQCC95liFBBxR1VVIt6SMeMKScCVgCYepOxoDDl5ShC94wdGayigjkaKrl
	AznmI7ZsddBGlCHkN+AYCeAz0NPkQ/TKPEXGKfQDi2+YbWusehSa25uYXEFU640X4g1v2an7jDp
	/2ApA52QD0y7I5t3fyE7aRa5ZfnokXSenRfPIeoZRB+LD0eUlKFlckSp74MiWGMQhuwB7zelAit
	fRVQ2ypKtOW/uNoMc0+lpx9P3sNpbSAMsyUQWYixRGD+V9Ags5CldtRf2ldKNreXOT4NyUxiObE
	Q3ywKvyf2erpT0jjlC34xsr0LkMMmvlkCpOxgf5sdWLp893RoOb3ezmALZIL/Egd5c4KvGy/zax
	Caoo82R7GCFcr7ixLTcmYDw+4AZ4GbSf4QIgxW54PSZL03TUsppuqpoq3MW8=
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227265785a.52.1793181133652;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227261585a.52.1793181133055;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:04 +0200
Subject: [PATCH RFC 1/3] clk: Add a way to restore the clocks of a provider
 after a power cycle
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-1-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=R7OPp69UUHsoM45Tq0LsjlUIHam/eQ9Eg5jV4WSy1Bw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXH40jsyfn2uWVVpD4XgtFR05IskSEQurpPN
 nkWkSXSe/eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFxwAKCRAbX0TJAJUV
 VoOOD/99mJfp2dYwERaYqebAnLDY62/wxdKdDrQNlryNiQ2eIgvF//s6rfXNKd3GK/BI2ly7ZKv
 J0ceS0JzmNb+Af4Q5rlMMqoYd8t1AtWDzcCkxICsHZ8ZBu5ir8A9McXBa8p8KJZiO7w9UVtEKPo
 iyliTpC7rSXYZpcO6V04yG88gdrR4URwtTlxzS1E4zWmflT2PCIHNxOy/ZD7GQinEY0nwwGjf8z
 hpgx93zHAkwdJCtSqsEzWvpKm9zotMbCtYi/UQjRAhimLV22qkcNQ+xclMgnJKo/yDT/hFOVIgX
 HzSumtJgHo9/8Aps1iEiFZBAycLilB3xzeT0axHkqMVFd6mYdrc+hJ38Y4r9GILEfbWcnQ3W5n6
 TbRQYM8G9a8auk09MhwmrSiSWqVj51tyVWgRlr5M5Sa9mcxuuB9KOoif9OT+OkNJrZFMTfoAFMr
 QkguIAGr6JvMqMoDa7xIJM00//1ZtGLYmVvNcb0NDTgAIfTso23XsTF+xn4yDP5Fv4/fP47cY/I
 nafjbt5kF+VVayAC6L26Hf1gdWL5dLI9IczJuKJPead1H9xrlZiSiLTURKAdfgD9JS4s1YQSUUF
 YieHJqxvlsGwkHYoCLlNW8x9Q0f6+OQEn+COsiSkv8DwIsgkbh6dxg0UuV1rI3bhV68EUOEfAg/
 dx0u8b0Tz69/DqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX0IZBqKZvbLrJ
 U9vRIAfY6E8ncZXz+JVpYKTeSdsknwXQtGeuUk8tNUrzgHRl5bPdpvtknJwKCfeYx826EyuE21d
 TDaKqvoJVcTQZoTzXZgFfZ4ZcPCJWxKGCdsgvpSFrj7ov3XyAyRb4mOZfuVyLeCnP8XBymPgBLr
 9FebO6GJKbBJQvBO+cGFNL2ZM3HZxBHVRGTvq0ECuxYrfcHKk5o4AM9N19NRvMf3lZhT0ui0VAS
 GxrQJzdtHrGZDYMVhTRPeAbApzj2CeQ7LSm9pH9+YQVkxqj58aYbIO0TodBh6icnQ4ohqonTuDs
 NFPe63uzM4vkEJCPdOCCYELUfTy/HeCxW1TsZOuFOVG5O4sq4qzuaSWXJWxvoQ1ESrAP2jHPFTB
 qlnjH/GeqmETGKXJwd+C8QHXPdZMyS/ibYH99FWWaK/pWF6CRtCAwzVQ1Atemlnd7WWul5HG+rO
 N2BFZG4rzukOvM8foqg==
X-Proofpoint-ORIG-GUID: X6n1Od8IXvO-aWHR3l73YHDUwR8_ekZA
X-Proofpoint-GUID: X6n1Od8IXvO-aWHR3l73YHDUwR8_ekZA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX05mDgoYHEUwx
 wMwevhLkTYjb+AoDOjINAL6nf47hP9c59tw8alcOyuKAao7tGVvLNual0vEENqtk6F1wTlzmyTe
 LkUcGUp6+593NQOLniTyBskpCw7ARQ0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1c5ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=clSAYKwqOTSjvecp:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iZGjZ6MVmCN8NQm4dLAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the hardware has been through a
power cycle and a boot kernel, while the clock framework still has the
rates, parents and enable state the consumers asked for before the image
was created. The consumers, when resumed, ask for the same rates again,
which the framework sees as no change and never programs, so the clocks
the boot kernel did not touch keep whatever the boot firmware left in
them.

The existing clk_restore_context() depends on every clock implementing
the restore_context operation and acts on all clocks at once, which does
not fit a provider that can only touch its own registers once its power
domain is back.

Add clk_restore_context_dev(), which re-applies the cached parent, rate
and prepare/enable state to the hardware of the clocks registered by the
given device, parents before children. It is meant for the hibernation
restore callback of a provider, so it is declared in clk-provider.h.

The restore_context operation is not used, as it relies on a previous
save_context, which only clk_save_context() does. Clocks left enabled
by the firmware but not by the framework stay enabled, and the phase
and duty cycle are not restored.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/clk.c            | 68 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4d2cc86bfbeb..316c3c85f247 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1449,6 +1449,74 @@ void clk_restore_context(void)
 }
 EXPORT_SYMBOL_GPL(clk_restore_context);
 
+static int clk_fetch_parent_index(struct clk_core *core,
+				  struct clk_core *parent);
+
+/* Program the cached parent, rate and prepare/enable state into the hardware */
+static void clk_core_restore_state(struct clk_core *core)
+{
+	struct clk_core *parent = core->parent;
+	unsigned long flags;
+	int index;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (parent && core->num_parents > 1 && core->ops->set_parent) {
+		index = clk_fetch_parent_index(core, parent);
+		if (index >= 0)
+			core->ops->set_parent(core->hw, index);
+	}
+
+	if (core->rate && core->ops->set_rate)
+		core->ops->set_rate(core->hw, core->rate,
+				    parent ? parent->rate : 0);
+
+	if (core->prepare_count && core->ops->prepare)
+		core->ops->prepare(core->hw);
+
+	if (core->enable_count && core->ops->enable) {
+		flags = clk_enable_lock();
+		core->ops->enable(core->hw);
+		clk_enable_unlock(flags);
+	}
+}
+
+static void clk_core_restore_context_dev(struct clk_core *core,
+					 struct device *dev)
+{
+	struct clk_core *child;
+
+	if (core->dev == dev)
+		clk_core_restore_state(core);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_restore_context_dev(child, dev);
+}
+
+/**
+ * clk_restore_context_dev - restore the clocks of a provider after poweroff
+ * @dev: the device that registered the clocks
+ *
+ * Program the cached state of the clocks registered by @dev back into the
+ * hardware, parents before children, after a power cycle the framework does
+ * not know about, such as a hibernation restore.
+ */
+void clk_restore_context_dev(struct device *dev)
+{
+	struct clk_core *core;
+
+	clk_prepare_lock();
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_restore_context_dev);
+
 /**
  * clk_enable - ungate a clock
  * @clk: the clk being ungated
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c3a095e8da5a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1439,6 +1439,8 @@ void clk_unregister(struct clk *clk);
 
 void clk_hw_unregister(struct clk_hw *hw);
 
+void clk_restore_context_dev(struct device *dev);
+
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);

-- 
2.54.0

