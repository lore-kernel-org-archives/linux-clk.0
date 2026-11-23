Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445307;
	b=058kgh+tei6mpT1qQd4tLmXRFrT3hsY/AfO1hqLmhBMx6P3WKK5Anf91oPC38B3l8t+3
	 0zYgdZUhbQPeScNyPvmFjBqDRfbJcVPHP+FdwYCEBVrjcpEeB1JAaBqKxgznimYlPDj2G
	 ncel4X4lCtesRP9MDIHAYkPVvG8MyHhb/rS7WlYlP37tSQr84uzA93ChDVyfWdJtoLhVi
	 l/9pPrTBEYt64zsO7vq943Wrm7+MJ/ppkpXLgoGJItIWLncm7JysL458Cc657Gaz7GgKn
	 7AZAuMEaYNIYZpnV9gqIOUPuEMzSEf2vXFlYtH7cznAylx04ZHVdPY55gd6OdPn6PtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
	b=xHv4wa8WTsjQBoAiwAt7xkiWlNVFPki+ZgIX4Si7susgbA5xl3UC3r5SxNPsb8wgmfSE
	 LcCVjw3hBcqIk1QnGR92oHG8WzMnDl+PgbXmHiXr4O1eMv/rCVhxdyOTV1R0TGNAMcUlC
	 7kvUOQ7Ck8N4U4lY+qD3VNrqXn4pq9ORea5wZ8vmkRvwROR7MkO4wgIjCRcRrT18ECOG0
	 Ts+NyzEe0I3f+PkOIW8r5GlG19tuldvNyoLKUfNZ7Od240fzIKw6pd124N20pjr010FXl
	 P4o0CDkkM3UJldooL6VIZeOdiycEg5AoGZ2S5XgKNSPK07Uzr/Qw3NJP85eTsa07bJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MvH5RKys;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW2U334l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D2606A32A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5D2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MvH5RKys;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW2U334l
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLF3v4030419
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=; b=MvH5RKysmrWlK11d
	8UbI6gta+ylAn1NGUqHnrK4KENgiFR96bvT3t2QGOefJjsb6vf1C5/YkJ0mED1l7
	H33QXL/HSHyJ1LO0YYxePnwyuaIL74M0l7oMsSO6fHm2nHlaZTS+/nLCxyJnw/02
	pTjYML9pSsrpWN6IApxcgrt1y6iqKBTRQ3k5u4DWKbBWYB9XTSERUxsMgqfwFGPJ
	X5Reu/9/TApnZPnGvdg7fmZPhNYRm3oT5TCWTo7Gt9LX9X9maP5sd8JCM5l0/+OA
	ydyOUwA5pwHiRNWdhYUOp5QYvm8JL6dMzqO8QBgA45AdLPHv9p3yIdfogRVuj7sl
	20raEQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj3a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:48:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee433ab272so90011e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 06:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445305; x=1796050105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
        b=FW2U334l+ZiyMCjU/QRoKPlAuCBuNC54mLe6nucEPKk6NMTI2lc/KdyCSPyW2XaguA
         83aSLX7m47t6UzFtBCTFI3nzlC9u9PylcMb5cS1w4xKYDaerGm7sQDfGEWs+zfnuGhpm
         8cfU2UUg2+6iuGEm6zHwwVmGZmyIOy9HDA7JIIUz6BKuJXfgXX/8+hYqI/qak8/C8Lnt
         zX5X0ZvJnvgIw9KKzJmT0WjmIbQ3/zOyoGXPXSDU4Nr5aG6lJhI3HuJUu5TA0US3yP/P
         7DT0+9HY0mm6F1k38F7GtwmehzZYn4xVGSq6Y0uux5XLZVz+8Uh5EzZguQDgWX04ZQ+I
         Nx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445305; x=1796050105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
        b=ubaiGkBq1fTNPqRLADiWuddP6iWkSoa5/0fZTvTnmQGS83LVyHpmlJQyBkOiBpMTTN
         f9ylBSUmqOxk5rSEhN9LC5c48bLQ3ES5ZTDr3oXWjSDJ+kMtD4NSrY8JxNOwFF3fRou6
         aA9Yzc4baWOPmaVBnrFiA3mEfqKb0kxNTgorR1Qkn2nTBh/hsa8ObTrm6ToU0SMUSPLs
         vMc/eBr4XkZBp/izMAog8ET2230WASCZSET4H/xFRKhTlkQjVBjCCVR6YJqR0fHbVVn+
         EWzT2XGYdSRUH3Au21uzv0OwDLJUbcrFLQpTS018ezOphLYIWg5T7HOmw/zdk642goA0
         el/A==
X-Forwarded-Encrypted: i=1; AL+hErE8ZjJ5kRU3UkNG4WBUZAYUpARoFD+uBCejltJ5GieaqbhwjufGwPfYzmZCJg50MnH97AQCgHT3hSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uo9+jwXYv/VpleRL2AvDU0pdBQllQcdnv/YOTwuPd12qHD2e/
	CctRhZ67jeW3dBgApwiUFNbgYqafoblGxbqWbBxELfKtwWfxLq82pqUmiYo/FEJOx8ep2G6kmIu
	zqykurood7Ua3+MfUe1tiNbok/ze8FlNElpMXXz6JbHv5zs2h8mDGmhRX9pEK2JI=
X-Gm-Gg: AZFdTZfWt37eMQKWsGM9Kaz8g36dHviWF7fQmkdtQxqfNx8eilfurI2xfzzotPN+wpJ
	yFTaa3NxEvsAfiyImn3O7u3cD/oGvxzfQQvS2UNCNYB+wfl9XN7nCoQt9iXqb1CKKkrTSKBpqZI
	YHBmZTUhdFtXxlY+bEYD0ucxF80YPQvoYI8f7r5PNmznKWssgRjNmNI7z5B1msyo0Y5UquLHZz6
	3R8Ds9SU3x8n5CONWHkCVQ+d6x3k/75B+cXw0qA6tKPEcHMIQPKWFjr6NBNXbJ2s2akVflzDUoF
	8I176xokiEjKyRs2m4gkTqUQVZ7/v0S3uySJmoJ2s9py3bLjgbSLSRSljJJXxSNYAxp+HzG7AY/
	Rv7gXtOAZcqAFkCZq2vaHbJe5+gqy7AvHYym2gXYsSn3sVIeI/04tJVfkeeUljsZ+betMtcY=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr6070360e0c.1.1795445304744;
        Mon, 23 Nov 2026 06:48:24 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr6070262e0c.1.1795445303485;
        Mon, 23 Nov 2026 06:48:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba9b131d3bsm2631486a12.34.2026.11.23.06.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:48:22 -0800 (PST)
Message-ID: <e9e41899-9eaf-454a-a035-05f40eddcce3@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:48:21 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Consistently handle MSM8996 and
 SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b045239 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DDBEoBgM7bPF29UhCjUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: MM0hwXtbWvJ2B5mbr_F9Uq_PbWVagtgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX2GqhhEViF0kw
 wzZ0M9JEIA0s6NLZJdqEOAB87jcsgdd7lrcrLOdXOOjPQT6AdBYzY1PeqdE2bp/oD/UUnV6s1IU
 GT76mTGb6nW467wntrfJ1qpr7nrjRiY4zOEJW2gixJf5uF8MANyLnRz+sxG29o5P+74xb4KADG0
 FG76Q9nDEDbjVH7p84iqyrYwFeO2IQSsR3qZVtfcoeeWfEamoYuEp5iKhUDjVZkf/Y01e/4kf+7
 Zj//yxeVmFTio9+UI5ZW+lqNu3Z6L2J8KGQijWflC6fLL/dHXcAOuSmYHiSu9i1SbhFPvSB2Fig
 Cz7QjoXLfRPe5BkBEEgQYFX4zLGsLxJzcGs7vgxB+5AP2/OPM76GFt/dtrpXHI/ZTCZuvpbPai6
 +YXVasrU9iNR+teK6uWJaJWk3WUviOpM6LHJLKB2Y/hSxPag8my+HJMElIG57vPpN9+hlEhPFPA
 ZgKKAOB9iVf7mWbu1Cg==
X-Proofpoint-GUID: MM0hwXtbWvJ2B5mbr_F9Uq_PbWVagtgZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX3HH6l2FRvOOV
 cxVmcixhFI6ANf+qp6EQQRH7edzexz5a7MWhrzkKPhWNUTE/1nck16Qz/o6kW7rs07cI9IInQsm
 gjGLhwZ8IuXW2y3zwT6gMF8Q/JpEApc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> Restrict Qualcomm SoC clock controller drivers to ARM64 in a consistent
> way with other critical drivers (pin controllers,
> interconnects):
> 
> 1. SAR2130P SoC has only ARM64 DTS user and other drivers are
>    already restricted to ARM64 only.
> 
> 2. MSM8996 APCC driver selects QCOM_KRYO_L2_ACCESSORS, which is
>    available only for ARM64, thus reasonably this platform won't be ever
>    used on ARM 32-bit builds.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
