Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DE43F0A7
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424316; cv=none; b=sKTAwCVdWlk6tN2llgMFjdApfQ+sCK3nbctwKV32YVSbTNOJjeRqt4zaQp4Tw2aG9VWlKYB9nUMlOmLjq42RCQ7/B9iF4AAozVFJ5MBBLWc4k+P7v6bqN9PEGGFBggqePLFx690X/mHGRpNR4M6rmsJXcTSKJjdrsluUBR1iK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424316; c=relaxed/simple;
	bh=CVmZHUrtX5gNkqgPakwu+EcTWZMZSOZjbS/aZTNVuzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l11DX21r76PvXxbPpVHYsidApCibGvRym0QgCizUcMYrKECgmw+V73gmXxHKObx02LHq+3plwQrH8IPgSJlpkOV2QC5rbp+tBToNfTECbdLIYwQkY12aBXleoWRmZdFunWbERQimYRNAV1lhqv3tBnCqhzXmiCPtKD4nxljoPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETammhEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTm+r81w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETammhEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTm+r81w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh4RJ1384861
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=; b=ETammhEBJePEIOBL
	OGu567lRVLym81Q5efMqukA0jnvFfzBTX6004mtp/H9Toq8h4enIwwWCH+mq+dWZ
	8DEvTjQ7XC5PBR5Fs0M/Pi3mbW0r5w/adnD2Tjje/q/2gWIDXHaGlPsgUK/O9sgf
	LKVgv3aZ1AXk/+xrKhXiCsI7Qrh2bAOnVT/xjiK9ac+/L+gri8E/KWCOFMFzf0vD
	lM9riodiFf2BODrIpRK0qaukOuGUkbCQ1zBKejFQzCQjpfvHOz7N05+ll+Vn3r6N
	XaUEQyZk7xIpRdnSfap9OzGQSC9QODDiJYjx9y7LPYhSX1YJex+7B93h2pyJn5NV
	Dp0gaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0551-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so23930481cf.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424313; x=1786029113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=eTm+r81wDZWLePU7xtL267J2Ky2Chu1MIv67h7kuIiqoIw9Xd93lxtMft7JUXMXV92
         3w5Bdfpbe6mJjEehx12qt4zYcHviIYE5Gt7xx59VQ2SOwJwipsec023yZAduNrgo6Bfd
         RwTuu262bbUqsgV5ZId4tZMk2CdbIr7FFfxhfMluHVobkl+us1qSzJo5VLZulhQ5X0jc
         +M3ewS/QNlgOYFsjSFmVP1sqMTixZSd/V5ivFIlzAwWgLAtvy6aMwAtn2IinnvqRyQpV
         WZC7NSklWZpWVjfRZEiigCqBHcxZZSd0kQX7wP7ysy9pnuvY6ffOu9I42li2yJf6vP3w
         RNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424313; x=1786029113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=XLc8An5I6Jbpdv3ao6cizmi0b6viQvvlb++/K61be85Fb9dkSnfz9MXT/BvbhTY+AU
         GEc7peWxlN1qN7E//BKres4IMtBdLglQVngI0G10Bx8+ctSiuD8tg8l1LH/uhWHC2ddd
         TvKsHk0wF3di9+eeD2gipI+0VWNwBIOagcaj8YON4kFQhiT4pQ0JJCjGUL+xYYbFQHrX
         GOzfVKeddR7txIGkngV34FyoucMyx9vmcxRdu87LBGBupjUdhrWuD0t9Mg+j9d/aqsIi
         a39J0yuGVzvt3R4QvlToLauZRrr1sBNwFJAnhAnlGDuHszVomg4E6lSuRYNH/ev997bM
         QoDA==
X-Forwarded-Encrypted: i=1; AHgh+RpiprYR8g5oT8HW1OzEN56dITZemUDcTRd2+3+rSHtNKa2p0h6IsIq5rxzbFIp2pI1X6rlIJLLMYWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXsrmhuUj4PxZDvQEIVYz/gQCkYAciVTaCMeNGuMWYTjsSeCik
	X8wXbusAYsZu0dgKxVsvvYnknUsKG457mDAgNs4aQfGRbfb+nC4s/m6BVBh88ZU09G0Ug8gt53i
	NVtsPWNhT/i+SZHGF96V2U3CBcL36CtFu0NTosccIus5xAh8hiYfMUfS+iy002zw=
X-Gm-Gg: AR+sD13fBfPbYfIxweWkjO7Pg0n92McynZ7tiAAHzlkQblxeJ9ljJSWVi0Tc15bkErD
	LZLDL+qjD+CdEycGqB9sSdUr/dnaAVS/a9a6bWzjQGrIPR/3RygALPgIO4ph/U1avtgYaQgdaKQ
	k2DhqDI6NMxOI3NgWpQZjvFrFRTcJTZ1A/LLTlh1mK83aLtzevalCXmMED7tP0sd9ljDS1XTLGW
	DhfmZOvQ+mgy9hULg6BYo9bCKVCGRi1sfQpaU2yLrH6zIW6mhorfBUKlBqx2JN3QKsktH8WZ9fH
	mntsNViEnA2qruNXCs+/42OS3VqrxOY5CmdegoFtmrYd8FoY0YJY4iKMoy/z3Mptxizrgc4kCr4
	SePTTOMyO4RYLgd/UhBGLamQ2vGk=
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30861301cf.68.1785424312956;
        Thu, 30 Jul 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30860721cf.68.1785424312368;
        Thu, 30 Jul 2026 08:11:52 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
Date: Thu, 30 Jul 2026 18:11:35 +0300
Message-ID: <178542193568.317194.16641853631837366761.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
References: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b69b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=sMiTIix2QdjTHVfLxCsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: WsuZTUD1pkPU1Z4kAhyl3f_oMrYThXf6
X-Proofpoint-GUID: WsuZTUD1pkPU1Z4kAhyl3f_oMrYThXf6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfXwJ2YdE47xYv4
 nibEhR9i6UhCTLGL169rupVK41hOq4/UsP83y6l/0aW2w17f2xl9v3gxDya4CEwb6extZzgLVGi
 5G5OhB7LktEOwuWhcci2x4p0Kek0Fs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX5ne4N8C4DVGQ
 wugqjau1y7RTAF7apAv05hmwtqpk/ZzOywQQA+HDcSCfd0y0brhy7CUQn2+t4VJC9++Vd3VVjeM
 BQ4F4JgDTWkuAPjnSaMWBOFUGoP5oynXRmAWR5LJUCehvZGjEp2nCVZRItzELN8XIutwUfaTpky
 NqM3DLrR5gwBLAcIVZL6/PZx6SZu+3BO36QPi52aPkbT/faw7rZ91ne57KTxWfJKNlTrKZ222yQ
 wnvEAqdEDmzkVA/i2FFAY2WcluMx2hjWEF/uBkfql2ruygG/4JQfER41ehnn5rPAjPbfzj3btTI
 4l0k4e7z6/45pqMRB0FLpVnwSiEaOZCfBaxkyiTcfyrRBbTt9MyXBtOc+f+tTLIkxnKkm9PIHuq
 TFXIFbfy6nVfXB0PyCJUUsPhKBJPy1T37+xC+WIER+mnq86xcErZZI35z7J9v0xq3RNXk0nr4Bg
 o2jCRcIbZhnxqZOQ2FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300115


On Thu, 30 Jul 2026 17:04:47 +0800, hongxing.zhu@oss.nxp.com wrote:
> When the internal PLL is used as the PCIe reference clock source on i.MX95,
> a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
> testing with the Lfast IO analyzer.
> 
> Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
> the transmitter current reference to meet the PCIe specification timing
> requirements.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
      commit: 39ec460b56b26319d1f31b459e8be7ea34ae9c67

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
