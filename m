Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2834D38A
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423306; cv=none; b=XYYQUWWtn1BAorpu2Uk0GwgH+toDey/CCGzxqiBFOMGGh7u2Jqrk4s1ffJJwnEeqcO9YDq/lJbvxQ0lp0zTAtSSYoQpZPk0PtsT2XLyN/yvNsa4ylkrgVnrD8EFHREedbFEjFMNN5mpd3kt57Zsi4Qz/QJgBYjtW9zc30l4t67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423306; c=relaxed/simple;
	bh=yuU6e2e1qZAfjqJxAR2lxB+hua/aywi4MlVW193eIY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W1NUmK7NnUMzhzN1sf6mnOZ8F0+Exp9ELotO4d4Fg8NDxtJyWEMtwygz1s0/cVSwsjPjIXgwzCJSsVFoBw3PwlhoRRRurA+KaSNuAIGzUb656YB1yzh/fV0BP9roubzzQWfTbnJtzHgSMkoHc9qrWEplPNPOqr0GMKi3wB3fXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8aZRTTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLohvLkm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8aZRTTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLohvLkm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMGr0EO1902190
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 17:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uTJu74kOrD+Mhqkhf+/YtY
	rkCua8e6faBgar0XkLxRo=; b=S8aZRTTtflFDOmze8vOzRZTug63Skr2gyWXOpb
	OffiUxIl5oNZCMMUZa04HTcCciY6IdMvKuLwlM+RUFjz5lbeJX7Uyzc5Ba2bMqPf
	oQvbhHBcMh2ZavbA83C2U0p9GIklyKPgvREKjnZAjqbHigc0hOqZLVJ3TfFLZNr8
	pF7WkMi2SztxV+xBohB21/c1FL+sOpAfgRTZkzzZb1OhNVTx1dFs9jcwCXZ+59bI
	+X8MJXoOtRBFhBhnPj62Eiai8YyAdYnvmqLAPsRo9+DV0DFPRC49l1C9iuvw5w/6
	+kF+eaZgvNYHr5nMzyqTXjvJd8Tnz1QCUVa6OA1hgedYXypQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8g1nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 17:08:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso3970203b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 09:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766423302; x=1767028102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJu74kOrD+Mhqkhf+/YtYrkCua8e6faBgar0XkLxRo=;
        b=LLohvLkmfFK78HAwveZyRNtuuOkoBwu7DHQCIJemISLWt51qcvGnnw5HD7Odc8U3wf
         NBVbMLi2Z6TDDsK2eNSGtbup7TOkV82JU1+FpeYowacAq4RvOYafdm98NW2362S6GxR4
         QCHQRYZpbtmYs5+P2umJLpzu6Ly5ZxGRYWKVHSN76OUren5ip3I0FnRrUcIXTADRv+TX
         fLprU8Z5uEa2ArHo0+0cRzXAneE8y0wfaVse5Ns4/SKQy7FSOErQKxKOWjKkmS3mubHD
         GGLYqCNubk4gfSz4ZGG09GrZ+0wxfr+aV/ONmDrRTL2k9yzI9Prxq/qmIbxSGYuOah3P
         C6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423302; x=1767028102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTJu74kOrD+Mhqkhf+/YtYrkCua8e6faBgar0XkLxRo=;
        b=ATX6feK5N++Ie9Tx8QWj9U2CAKu2YxFBUW6JErC4Fi91ppAGmvcza0Gc4g8FJRAgr5
         Jcm5+8O1pBkkVE4NljShYHNiwVFP5oVK1En8nhTT2qa/RFjs5cb5CpUo0tnzZVxuWJoG
         pZ6cwGwo4YZNyCoRQ5o1AdvW5TkhOW/ck9BJELms9xLdD9kkzeX+CLoquk7paYHfHgFc
         kmq0jnBp+uignavfV7UuXtalduFV4ArJ6vWsMC/ZJ+gqTUGi0St/XSZQCoq9+TKCjqFf
         BBTlcFBHckwQeXGNnQ6YP0jKKReLc1fV+4mUXjnHnmHeyFUtr/vNRAegqs0G5X/O5nJX
         XE3A==
X-Forwarded-Encrypted: i=1; AJvYcCVSRyHluXj7kut1JhhsmXkyaJdPJkkuAqvAqCmvh9YfxrjyhHbKiRIszODbarMIEqYk6D7xCIKiuDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUio5/o7vTQRvOeNOwyFRELWNst5caUrU5kKQb1BbQZCwsSo0
	gS/HkZORqIzu3DQb5ucCM8Jzb+jmBQol+yMnQxnzAlB0gX+uRnUaToPph11vCYr9cIUFzNNNWTE
	s6B6z3KpE5iF8nQRu6cE6Mtm7uYrYyUL28wNpqiF7n3MOEDGD9G6JOvx1GnyVzPM=
X-Gm-Gg: AY/fxX4sg1jpA5EjNYCexPNDfLZDhpAIgzVD3Zwir0IeUOZ4QAEwybmWOSLQNtw3HlV
	M/yEkyO+X1Dm7YbVoZ2vyyoamJ/D3TZeKEhuZYvwg4acDDL6II/44YhqCRHYHKeWt5KzGJRJKPG
	oAyi4BuBmXeib2Xr4zKnUSEnEScHiIpP/h2xmf+SR1RDr1zf4xotB34DXDdtAFNaXTNbW8wiAQZ
	Q+RmoJGk60egTFD1erNc+rXxWLVflfO+mj3Xp2Qj5fKYviBVlCgTn+G07kcchxDVRQ0UWoZBPZi
	DZZFWB+6TlzJI977W4LYM35ifTbNOBAi7gkabsagT9tZP3ZWcp8L7zZJFkSr4AvyhWJW8QJJdzK
	Way7+Z7AkMO6pLkN+3Nq7ZSmSCCNUY/kbow==
X-Received: by 2002:a05:6a00:4ac3:b0:7e8:3fcb:bc4b with SMTP id d2e1a72fcca58-7ff551df0c1mr11653891b3a.32.1766423302222;
        Mon, 22 Dec 2025 09:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGoTkq6ENiYiLQXUVP+Xrflpg7TfjqSAtigwX2xx0bLzHFHk7HDNLAGumk7ig3V+Qu2T7RA==
X-Received: by 2002:a05:6a00:4ac3:b0:7e8:3fcb:bc4b with SMTP id d2e1a72fcca58-7ff551df0c1mr11653863b3a.32.1766423301721;
        Mon, 22 Dec 2025 09:08:21 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm10897176b3a.4.2025.12.22.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:08:21 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 22:38:14 +0530
Subject: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP16SWkC/x2M0QpAQBAAf0X77IrNEb8iXWdvsSV0h0j+3eVxm
 mYeCOyFAzTJA55PCbIuEfI0AZrsMrISFxkwQ50jonLHfhu6aWazeaY/UFVd6gJ7y2R7iGk0g1z
 /tu3e9wNYNxqjZgAAAA==
X-Change-ID: 20251222-duty_cycle_precision-796542baecab
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NyBTYWx0ZWRfX23AJoDvS8KtN
 eYslQHKLg2wPxbpZZYz31ZTlU1sU0FzWgZFyUfFNtDR0QjlMiqlxKtS5V96VTFFiARby2AZoRQ3
 8eqn+XInRm/1MY/d+te8YlehfocOnz3DCUuZQYvJpoPHwvM5WC7lrJjeEI2mCoudFS+NpEXHF6D
 G0dDaQ4ymzIADjbEZhgOGtL6POL69ajv+Ek4LFl4Uwny2ceAxpZACLk0QSomv70PZ7sv3NpTZNX
 wSZdt4OpuoWZvRv1WOPRzWsWMDODqsXbRSNi/Fs62bCJXz7JqufUMqE37ioQuG802Jmy+IUgvzm
 Zj79z7g/Umx/pY28diQMjmYHUV0uahZO+uM8200pYy7dsO81xyo3Fn8ObMZ49wsNY4RZX9jTlOi
 EEPraY+qddKGPx0z2Ks6Btcf1Hw2GpaXQ5C1LRd9EzOnziv6XlTUo5ewsZ5gbyv6nCeRhwbwTY9
 6wtgR5nd2p0McF8IIqQ==
X-Proofpoint-GUID: pb2tSmDY2xihGksCPv0J8N1VQ7iEm3-_
X-Proofpoint-ORIG-GUID: pb2tSmDY2xihGksCPv0J8N1VQ7iEm3-_
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=69497b07 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=igsz0PQQFTjIY3ArcIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220157

From: Taniya Das <quic_tdas@quicinc.com>

The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
derives an intermediate percentage `duty_per = (num * 100) / den` and
then computes:

    d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);

This introduces integer truncation at the percentage step (division by
`den`) and a redundant scaling by 100, which can reduce precision for
large `den` and skew the final rounding.

Compute `2d` directly from the duty fraction to preserve precision and
avoid the unnecessary scaling:

    d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);

This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
a single, final rounded division, improving accuracy especially for small
duty cycles or large denominators. It also removes the unused `duty_per`
variable, simplifying the code.

There is no functional changes beyond improved numerical accuracy.

Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
+	u32 notn_m, n, m, d, not2d, mask, cfg;
 	int ret;
 
 	/* Duty-cycle cannot be modified for non-MND RCGs */
@@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 
 	n = (~(notn_m) + m) & mask;
 
-	duty_per = (duty->num * 100) / duty->den;
-
 	/* Calculate 2d value */
-	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
+	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
 
 	/*
 	 * Check bit widths of 2d. If D is too big reduce duty cycle.

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-duty_cycle_precision-796542baecab

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

