Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC931326A
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625723; cv=pass; b=pOzUSgSA1W+gSv5iu1LyLP3aPx8oAp3SwmDVx5ODBh2d0qUjl+6FQ4vZeEH2Z7i1ZUXwH4m5FtwyzKqgwhmKOKW5U79fxKxxCez78Jf4cckQwgXSTdZM/jmQoTDnVmVEWv8teihJHzqpDgq0zcW+wqK/TqojPws83I0YehiHDe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625723; c=relaxed/simple;
	bh=7zZyH/lbSdSOTHBZXo+qGnWHJIuX5pvlxUZA27oLmm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4s1BK3Cfz4YVPocVLrIg5f1UgCjQqroJ3dgXWxscPlWqWKPHCCZPRJTVo3Uhto0NYGs3QJRirTr4krl3yYg2b/cBJSaGyBkWfNB6MFG0Qc9ik0hWpsNsZHmBVHmIjhnhKWHuj0R192Ccb8chY3jeEnPD25OrxD5NOGeGEkdnyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyYCjA64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4edmrKo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyYCjA64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4edmrKo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhSF93085139
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMT3+ohGxmlygaS+sxIbWmQQ
	M/6eFSQ4GIWlBLpfR8w=; b=WyYCjA64TR9oM8i/l62fkgTnmu76loPfjwO+vmtC
	onl0WZLfpHTl6HAXYP6NBu4whjtyzXeFjrmOBuxCFLnYJg32uF5xOZa8sqxUC18A
	8UHUfm+ma80fwj9nYQZAJZKNL8XYyrMyDibtP/3mf6JOICp/mIhQ0ITGX1Okeom3
	24EwTqbysB8ilhu8sf+m8OuI7Kz3tFt+oDVPLtwqzL1HdjfpHSX472yyo25ywHBM
	rS6hr+YRUGdjmgU9GRoUPs8bHRF9DjMYXrLBOy114YP2SDDcpllkIL7YhaYsbxW2
	4Xo+Jm3bS8bLFwXSDOr96Z6vzeshujbR/n3yiGg02uR/gA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn11xmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:35:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so3669837241.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774625720; cv=none;
        d=google.com; s=arc-20240605;
        b=K9Ler/nRRp/xK6hwaiFvxn1AOii884rdoAQxzXz3oy3YonKV7CRpHhF2o74bAFbN1H
         7i+5UQPm4loJjt6CwQXJ8OqzYzDHPg0qSCWDRi4HlEfgfJYx39cZhfAUxmzSVwAYJIhB
         MjGEo68lrnUpzHEmUNx/6T1yKeK+Gh25t09ITV8n80Evg5s9iifRXVbcI/wdiR0Qxp7K
         pgLwykxwf3/M0pUfeFaJTMXauPXSPcofoxVqxgywQ1f2daWbmM+DfQHDSjCG6zZJxsii
         iTC+vJq5v8lOYiL+fhG+qkQzw+FIOWH31O8kWnmlDHPTrnRotKGTSFGaA/B2Eg3olNvO
         F7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        fh=/9l9qKxBDG+qf52mbQ1qX3jckhG73ea2A7hibwwlbGA=;
        b=E53Dc19CihQdSnir0P+QsfdGgNlrjN/FKwy2ggyXlbDtFlyy+jZqCuNIJaxn68Pnmc
         wC3OqNXfqaU4Jbe62l/4/lQM9q2CCg7SnIJyp/ojSBAR/j3V5stDHs+zhocQRsZeYY73
         u3/IXcVq657usohwDD4s/hFLPJC/MmMFqcdZqCHeJjaFbkVn0rptZtlHefa4tt3s6Gnd
         xQQ78gCJc/t5N2D1pcftaB+4ugoCSzkfvvC6UFReTPN/swSRveGMpIFDLwMWjgZ6VgHZ
         GnO7KTzasDLcDsBjjdNG4n+gDQVKZd8Tynqiw4hMm1yGApRFQFa96rKq+9vB58oblbwB
         1XOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625720; x=1775230520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        b=S4edmrKohsDn1W1dcamdhWJ2CfjLDS5331PAs5UOn2V8zPFtlS5AysRes5symtxlSL
         XRSVWPWsBx7nR4vV6a2QIOpu0w8bY8YdNxuqd1n8gbMKJbn46BIs5XP2gd+FP5u2evXU
         HJaMWxLmVkXcMSMJrPunyTWj9xTdj843Vq/ZE0j6Em0GbZupK/4pFwb5EF3vIA236y5i
         eBiJGoHKmyaD3L80Cm6IrPthskf7YzNEHo1Z6l0u80+nFKpm311/e2V6lTUnFIXtnzos
         vQCVAKMPxgV9gn8vNrxPjQm2jOYyybj48ilL0buMP/kGKySo86mQNnHxMOnnuTMlSKbo
         Fegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625720; x=1775230520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        b=glvu6d3Fjq8oiVjnCxKAiTzgFwQsmJFLmkjnGwnT9jrdLV6eLwMdxyBBhyxPRskS60
         Ndg8c0+l/YpeMgiqtccj37HuWheO0ahFjvTTMu9nutHZyx11hxsBplCE77hg5tAwAJhv
         OMdbDlI07Rq9Ub8zn1G6C/KGGFw6mbzIr4UvhQGY8uLXeJi/pjeFhNsuh28tIYjYUhst
         GcjwrczT7jF4gEXf9E1rtAjuXIjO1syDilyWYudXMZxgrqnHIw6futrs5K41ZeFNsMI/
         PVhG2CR1lkQo257+rRoSrPiM/RFO9PP9dPpi16bfhxHVqL6xbP/U8cLk3/SJNHWPbvxu
         xp4A==
X-Forwarded-Encrypted: i=1; AJvYcCUSIvLb802N7UGlxJtgieSh/1Sf2J4sV0q3Bo3hDxXFeq/SQVP2nSilRO/dw1zajHfmXiIGTp1M6pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4LBL2qFeKytkZTBRfkqjYzlixUucx7uV55khKLUqQIUgNcDj
	uxfafFZeLjQbmV2CA0eLYEjfAjU3RsBJY6MdYkl+ErFd4qlr1zeSpSCvxmK/U5dYxv9bR4+05S4
	Qf0M2k8JaX/nbNLWudZbtiMCOAaFPwCAeLPpv35fDp3Xg+deCG6zo0XSuDKMRe3u1JYgGr6SOPe
	A5NmfA0+Hx7I/JE/LUKj6UNKkvFous5yTtU+GpHg==
X-Gm-Gg: ATEYQzwWwkYNEPrHKLDsAB/2S7Pk1ajOoTLT3iaoflSf+lvLHnlXlYPZ2+XZ7CvP9ro
	TsFrHmRjY0HvHDWgJ0x4ii7GS4XvU32lz3yQVakaPv3ENpYjvH0G/r1whk22YhxZoCn42rxSqeh
	gfLFq1EJMXAjpaA6TNtthxP9KQsLIpIXbEWo/gYFG9BrCtShXVlTI3u8+kPvyS21026HXPaMqPP
	wGex/c=
X-Received: by 2002:a05:6102:801a:b0:602:86a6:9877 with SMTP id ada2fe7eead31-604f9207448mr1318425137.19.1774625720242;
        Fri, 27 Mar 2026 08:35:20 -0700 (PDT)
X-Received: by 2002:a05:6102:801a:b0:602:86a6:9877 with SMTP id
 ada2fe7eead31-604f9207448mr1318394137.19.1774625719840; Fri, 27 Mar 2026
 08:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
In-Reply-To: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 21:05:07 +0530
X-Gm-Features: AQROBzArL55rBfoGm-EJWxEBft_Yhyn14M2tYPDSJIAQWe8jbwmtJIHALjSUpGg
Message-ID: <CAHUvh4kqBYaKQ_ztiYig2iRGwz+7ypk-7mVms14gRpstzmvq_w@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXxNoW9WfoyH+z
 doBcSQAqVbX4TINT+8Q7mGjV5pip4kF36UaF2AjWo4+NHuuCKWqY2VDaHznLdameS4JCb1k+CMy
 myTk+t1uapjaEESO0gwhA+u+VFPkYYk7FBJwYBpIkPJSTSr2Ru71IR2DSZdmMODr2vr+ideY6J6
 y1Iy1ue3oOO7y5k0BesSt2fpbdG/Rt9vh4fnRpxiN2mZZwkgDZ3b2OuHW1SprMZNOf+w9T3W2nP
 G3z79kDn7GjzPxaKKuI+0T/o67VZkmT4f8C8Qz2KwN40SxjOELEf6LM7mC9BF3JJa+AsohKmcvX
 bt3/0GU2czr2Z0fwRp67skORnzpQ9pp/66TOIaFvNaJXx1EEyTqMQxhWI+IfjKVIqOS8dwHbx+t
 pl3yUMxa9cjoFRAo5K8r5q0SqFfXNrBgtT7C6fYYhlqO7yhQMTedjxiMIn01oQ2QyM3WdTeID6c
 FAfL4FAcJI2RLGq+R6Q==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6a3b8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=mIfB1nhJP2LIQaxH3doA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: zXXFk4s39S0L4HSBl6AN-qQrGW69TZOz
X-Proofpoint-GUID: zXXFk4s39S0L4HSBl6AN-qQrGW69TZOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>         qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>         qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>         qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
>
>         /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>         regmap_write(regmap, 0x52224, 0x0);

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
