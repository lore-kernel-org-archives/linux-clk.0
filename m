Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D6330327
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576545; cv=none; b=lZG5e3rWF+1XOH5u/B7TbYzH2IjVxZMkPAwa3N62Gaq/UHv50/mUpO43QHqrhrX8P8Lhz2XCjM+yAjqS5gJ0nRb2USBw2fsrh2Q8LfNkqrc9mcqrd7NGPyc8FBtxLoUPrF/ZAyzuaGQw8Ko5j2P3/P9342AcniOiBbjD5NvU3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576545; c=relaxed/simple;
	bh=9hdDvjId8Te0bYmkEOvuaWPWD7t2fGMNgkoufbUfEGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGf5FAZhkMYW+VYk39bAcPN5xuNeyN9SkjligU6PTxG/Mi7aeEso/lGBultP8qnpmsgEdSCe5SBmtcjF3azW6SbpMSIyrfD6u5yxS4syhdf1vJXKklSIX+lQ8roqcxVmvn9FOk5NrOJuuV5KJfz+ObpSNmfeLuwFt7KtiyBl9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHcgvZa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hh4IjuUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHcgvZa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hh4IjuUN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6wFvD1245478
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+XKdSXfu3p
	NvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=iHcgvZa7IeCwHNcgLOGpIEo43M8
	DlnyRERBvyv6e5iqbd4LVkpoqv6HzMC7vWVG3WbVSaDAu9MXWT1FFwikv14/BFQb
	YpVtsqQqpZiiqYdRKDF6EVi5CpedZ0SoGgtJCuZ/DVcg52UcnWIgX9k+AoW5ccYj
	gum7esJ7Kl5bxgl/biVE0tTYrLnnPp72REC4T9FnupAygldeP/ol7rwxCym/4t0a
	Ef4us7Os4NvDNosjARl3na7COgorKzNErejOQiADvJ5a0XtNaaom7M9HPEqHKjXv
	QT8fjVXFnf5TvL5zmA/XdCN8Y1pftMFhF1AQ69NxqYK4j5kVUmGpAkoA7oA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cudym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d60f037bso132392491cf.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576542; x=1767181342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=Hh4IjuUNsAr/H9qkbJ3AlZvwWVwbCbeks1hyKgSgPSy2K1In/Dk7h21FK8cRV7qUGQ
         qJKPG6wdOeLpzkv684Ja40OGbFenGdKcgj1xT7Kk4yLlvNupstZDdGisZ2vgEnvAKhdM
         8Jh3Ex+drcMPXckPdIo6Y+ggFkK4mvXluAWwRBok/d5dH6wQXi0LlHmO71hp8nUhLrm7
         +FPrCsAzgnclhUcf7u6Mj5gwSQgOh+N+Z2Uapce7gcAKGpZFvTuOVI8j9KtUkD1mYi2W
         cnh5h3Z89QuT7nraBHBXgwtkX+LoiqbiAPm8s1DeYBvRrHhxlDpiNaqtetOtaMUYHcJE
         ty6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576542; x=1767181342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=Cz2YxuDaqYSapCIimwILLOFqlFTceiYoX/NNHnub3arVLTGkDEjWsZ9eVStkm+sBo0
         IGn47njg5n9iefQpynswJZMeQNstJrKJmDQWSnmXp0yd4qbxsIfPex64MBAf11YkRCGg
         4/PmbjqHP4ZKIKTnAN2LYTKAA43riw17b7gJHBFjfuCL8DTNh7WLwceTMZLLiUMsQqMh
         Y6fU7laTfCUNMXP8Rwd8M2cRZchfTvc3ebAM1PqdysBvPkGvYdti4epXED8S1prMl0Bp
         7ru8/kNW6/DvabKTuaiUtOv7n/kVAutnF0rlQFcOudQ6J0VC2Uy0CKEwdWEa4DnR0iO0
         sJiw==
X-Forwarded-Encrypted: i=1; AJvYcCV3oFUJnA0q9T/73dQr5n6Vr86CyeEwmbG+11vFzdXWJ0htGASE1U34Bmvd4//QTgw+otlH3pwsWDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFDfJ8AeVMj4z2inqFxU3Cm7OhMjqp0PWk+9KGTlSvpUaJfQ9
	cc4+Qfz+eHjrMH5KGCeddMeTTd7C53G2m5wQmU8hUHOgZNS4S0Oy5JfOFcwh7MeIWGn8QlhCdqr
	rpn8euRIh6jsK8yQK87RiLwOME/Vp68a1W+sB4tc0uzyDk9bhlcWJTMatAezhloM=
X-Gm-Gg: AY/fxX4hEn2ENXOYAcYLDfIoc+ciiheJ8lwO7YoNvecSFF3FHac/rfKmXxZSttYKGGy
	LSifA43lYW3/6vfs4UXdINe/aSR6xXPZEpBRM98zMJWhFzh+fLTJ6gwrumt0hxKiJVTfxk6s4sw
	N7vohcEjrby9Wep8lTbUHwaGaUTuDh+ADHhB7iWQN1uusT3HqlGt7OGBkKm9dsstA5oGhUc82lL
	8BfrhJPaMPUD94I6QCsmQZN8a8PMmf5QUcq6tlsucwg5O+xuthyoTbpM0ZIxONlY3yjZxo5439u
	tQYthzb+ffgov+IJ2rlwN8LxD6z4krOYLT8ayI+UwrjhCDgeRxkME6UlrUVneqk3oaY+UmWc6XB
	/+Xal8THVCZxqteSdW2lAmegxORtU+zt3oDMGJSOhjIlIeiJ5JZtyINRqeA7BxDnFtu2cFA==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr291500371cf.79.1766576541688;
        Wed, 24 Dec 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw4zojM9zDR/ZTMRZKigmTqQPwRjtyXiwWPmyJTbj61ZBOWXiujUre4QxPIpO0iM4Dld3FqQ==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr291500091cf.79.1766576541354;
        Wed, 24 Dec 2025 03:42:21 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] clk: zynqmp: ipi-mailbox: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:42:13 +0100
Message-ID: <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9hdDvjId8Te0bYmkEOvuaWPWD7t2fGMNgkoufbUfEGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GUF8GSyL5k4F6Bj9PNY4tu09n9wJYX/aQaM
 p3d4vF4+JOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRlAAKCRDBN2bmhouD
 17TRD/9qUE5aGnyhDDV8uZvawbVBhgYcMC9iOW9O1hvJdzwo77W89yYiPfLm4+MHBwO1J45tQPq
 SDbZxSC7uPkuBWzfoohiQlj+zkHyVrb7j/Tg1k1YUbhKTUP3lDFy2vfDLEOuLEknNW6ohCyXD7d
 RwlUeiy3jLBc8MlgUv8ZpTVAoLYNY6rtjBtkK7qGzEpTU+a05jmVu8+gFqsBoXBoRxSIVVA/uWa
 FEMrIt0XU9C3pecLH0H+OIQ/mB88HU1WbXdzf4fqw7l2gSWLu/7nDDHaMz4E7wHXql63DEOyoxC
 ZPmW2uLZvS8Jy+8082eiJFb9K4rdbRgI8PHlyin117NfLZK6fFDUmSjbi03/nB16ZK2lElNFO1D
 1cEUqQmWNd7LzwDY3+5K5LVrHB4x50hz+YTzqoXiquP3s/of6o26ysBXxH6oWu0ka/u5irdjjwe
 CPsN5rMPhjkZpd3tCMEyA5WhIFZj5kQ1BHM/mr7rILbldSBZPEqNf0vHu6sxgIOf0yG7PZ8L1S0
 3JxINXZbiqOyjItOnzRmIhJUMSKJFaTgz/cKmedM70LW+nciCmLaGEmOtF37mqBLQo+Su5JCuLE
 EfuvhYm1g8Tv5VtodA//0qluXNc1aVFHaSymtBjSYQNeccHPymo345/zxYPgtcnbPCeYfPNWvoY VAvyghAIzZGygfg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ayo9Z8DIMDRb2VHiDHkRk7twKmnZJ3Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX/2msJT7FGtNV
 N4OO9lEqsV+xh4lEjgJSgxPjxswD84klz4scNYLaubiMpKcRBKjcxftFbxpxJUbfcJ2bWrRXt8h
 h1PkHG0MOFrVMUO8GG2tWYYScN22XRv4wey9Z+6LRzUXxK+msldAqc+u4HuLMg4kSzD51sBWUb4
 eff1Q9tJlWiByVOSIE6pM6sJHhdjWLa/+52g40Qd+MSAmCDuTad+prQp0S/CeEa+0RYuQWIa1o/
 UobgjIKVVidRhgsIxXdV6LfXBqZkcXSQB1TUM37qM2ynQThMtdp9zv74TE2rdyRCWct7IO8hGTT
 FRNDsgTJ/8OWwiFUed0HNo4TzQAH4RleVVG2oGeCZMT3qx4kitSqNTc5GZu4sIBE5vMSJPCeK+o
 oJ2s1WEYD+SlATA9E/ZIYVy6CIQvBJKE1id0im0BcN84Df/eOoZIiy+nPSRhqrw+50PjDSHa7zx
 7Erz3M6647A3vRu6b0Q==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bd19e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zQe2su8OYnrQ7J9-Y2IA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ayo9Z8DIMDRb2VHiDHkRk7twKmnZJ3Js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240101

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 967967b2b8a9..42d2583e44ca 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 static int zynqmp_ipi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *nc, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct zynqmp_ipi_pdata *pdata;
 	struct of_phandle_args out_irq;
 	struct zynqmp_ipi_mbox *mbox;
@@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 	pdata->num_mboxes = num_mboxes;
 
 	mbox = pdata->ipi_mboxes;
-	for_each_available_child_of_node(np, nc) {
+	for_each_available_child_of_node_scoped(np, nc) {
 		mbox->pdata = pdata;
 		mbox->setup_ipi_fn = ipi_fn;
 
 		ret = zynqmp_ipi_mbox_probe(mbox, nc);
 		if (ret) {
-			of_node_put(nc);
 			dev_err(dev, "failed to probe subdev.\n");
 			ret = -EINVAL;
 			goto free_mbox_dev;
-- 
2.51.0

