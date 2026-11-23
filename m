Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461614;
	b=z2sDvlSrG3MSJIWn1Zx0Mltw4TBoLJraww8NqXeOwb/fYf12Yz8YJ3TjXinmHJSKGr1H
	 C8vRREvK44HfnYL34jucbb603fm/UwTyqfD1aVff/1snQm51omJ8IYj4SCr+Cv8/Qkxrl
	 w2rPpc6hb8/T/UysTKo/+ke5RlyWQcLCZE4oB6Y2XhGsfIvuXCCOZhxNT3w9fXxM/Uhrg
	 XANt1De7//Cfq8531bFs4nBtl6LgYs5qmwFDkrrrGcabrj5F1/0yb415Pd4o1a0J3ONfy
	 06E5w3YuOI9uKjA87AtQKVZu2+JDy+V0MLSAoD35Grf3xC44A8NmgCBS7GPATj9gI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
	b=Q4WKHxt+x4MfcvSqu5pWwfbQ4dXMuiIcIZLpEzGiIJ4hqcVcVG4oS1f0YsLj0cgpJLOm
	 gV73WDTcuAiw4Dftt6NgKymZzEkLRKNVr/aHwj/Um8d1/MIEfhLWDt6NktELSYGMnExdB
	 GJ/ZvqHdfu4gAv2FEoJdCXzwoVZI20FfkR2nPBLcB0CJrrwryS12ehQiH19424Kv5Vu43
	 fJGPPCJAtbSRcffwmhgxfgJ8gR3pyx8BeotQb23U1dLcswMqJ/L/yqSIVA+CdiBDTS3ri
	 90gF6kirK89289mC26lXUIxgdLa3df47z2CiNwIJ1LmsvA+TsHzPW2UNduv4VR+Ctrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaG9ePiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLJgLYKb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72921606A31F
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72921606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaG9ePiB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLJgLYKb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8FP2487483
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u14gAEo+bgmbBRpH6u/ppslz
	cwxP+mD5wjPj2Nc0SNU=; b=MaG9ePiBTqPuVzhotNxHqFYGg6bNmF/PJEyV2L7/
	n3wRco8WYIePu+jjpGsFxR4mH+HSrCZe2zryTYxGrSnpqPFtWcSNLeupcoE44KGv
	0RFWFmxM5wf1HAtsDzp3rkdJzzJ84DUdRIWI8ywnOVwb//gq7QY1+GxDJyd36+5j
	m8TFkSMI/+2Z3Nn4AqDB5fupDs0x1A9HgnozHidr//e3fZEH3ThEC0lXs/IC1egb
	yEHluimctKIvVQzjro+tlzpESTvw7S87d1rYgsYDAHpBxUa7Yfw/zIEx+eVz++oH
	kaS0A9T/TKkm+Lj5hKV0OeFOUZ5fXzTCFhwt95Vriw1MEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy0340p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so688515285a.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461613; x=1796066413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
        b=iLJgLYKbpWxlC2hIQac00iL4hZ15A1k+0PVWpn3HDwAOmAVpTCU842hhGE1Q0/vl2Q
         pQqit3G0rYIrEYCFrotPldPvMV86vWMHurbtuCkGJeI9FROThEGTl5CQR30Ga0KYXQI4
         XgHmf0dCSkIcNG7L+dbGtwuf8aYLfq7OaoasTTnvnT2aM9QPmmzpjm6FXDprqlv9cNPD
         hiWe6cViT2u8ypLIMqdBYikc9WwV1Tz03EoHsOcoM6BcPGAP+v6TKlaFTmBD+/xgAow2
         mAjN7LL33EQeCFfU9P7zZd7haXjFpQdPYJttzTQeVZNCeVBW2li0jHufS2rQRWwLsWCC
         Wr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461613; x=1796066413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
        b=vHPNk0E3wuie/pQw6n109V3kO1A3dhbEqo5gWATzSBRfVY+B3naxWLQAR4S9ELP8oi
         EMJb2BxCnJxtPVoj7fPafTlTj7suODCwUHrWFbvhSf9NRP9/3K6mi0bt7TVEkkp095uZ
         3twUTGMTcFJDX01E7pRuP30i7/phhZ4k9TbFxTU6u9DIJzh3IOiXa4MkbFegIuVk2LiF
         6bbrWVtASLs1LR8nhnbthf0U8ir4gPDQ02iTI249MYjue6bBK8y51AMBkZ20kBWgEKqt
         fgFv781lFswR/L9JjRWrSCXF/EATABeQlLXgANC16NBz1jkNG1qKVchEKhsJvwqhvL2B
         YzGA==
X-Forwarded-Encrypted: i=1; AL+hErGKyfjRv+EaqxcmyGykz9inNBrz/wzEjKyZGThrbBgYT+wtt0wvFKe2coM18u5OgmXnFtw33WoPWFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GjA7RQhOMxv1/IS1OXbwwSuPn4K1uZxpUyF5VHB/05FwUZUQu
	35OzP0F4UdabzT3XkJyWaUvqwHYJIb8h6Gdp+eRRD4ZHTOsZvZ32TRbXdJjoNpGND7Pdz4rcfQT
	O/BUmm5Ve1OM99O35g0egFRpWqGvhddtfKZbgufQ8fIlPxogiMvmIaUGR1LOctl4=
X-Gm-Gg: AZFdTZfWrdrU2MV43JKut31uTiRjgffoPDuMqqulyfwpesHB7fyqGQ33jQVjf53GljX
	Zko7jmGNuyQ3MbcnWWg5alRZH5Phzg6zp9CCI6T8mhfTDluMVRhJtnnltG5QcKFyUvOAe5h2hLX
	sx8zKPYHE6+c+aC0Pd718m4ZA/du+JPzBI5cgkhzWm7UdVAdRphzLdFEIfzZUh6nl8G66DCm9mY
	7uTGpmmAoCUSXXF2eKKO+iIoWjYqgXh/UWJCwmn37Su+oThCkFfBCxYcyfUesUqrVG3l+TGZtrZ
	RMWiW3B/KxeB4In9k2lBrdBiXtlaQxfXmekV5FRQffWO3oed63VGP06zvCLIe/ahr9iOqK53U4J
	Jc2X4nVZvb38wkmsZSO6u3BmWZ3VnnkZPva6DrI1yvUrDzm4JVCYfopEbbNN8Qpvo
X-Received: by 2002:a05:620a:7118:b0:93e:c12c:43ff with SMTP id af79cd13be357-949bac8120fmr2035596985a.76.1795461612465;
        Mon, 23 Nov 2026 11:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:93e:c12c:43ff with SMTP id af79cd13be357-949bac8120fmr2035590185a.76.1795461611834;
        Mon, 23 Nov 2026 11:20:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm24266082f8f.28.2026.11.23.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:20:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: Consistently handle MSM8996 and
 SAR2130P
Message-ID: <4xim7ytjjuojqe2uznihksv3picq5ovfnibm3b5cvyht32goum@wnu6hpckeosp>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX0P+Wf7wOHnjG
 LoWKilcokxHp4y0eLQjHQz8fc+nS/tdK0IfCRc5eQrVcqxohRPzH8ic5DIJzn5UHLiwSoi9H+rf
 w+o4L1K/lWHSCLXsTyxVOYGTxF+vyGKS9Se0gwaWETWVwL04EEhF+37yd3UNTDfpgrWuuh1fIkk
 EnmBYUBWYfv5r1F9PcNJzefUgs8kZzN/Ij4OPDP+LfWZVKu6VYBpD8yNM1S+3Tt8NzHlg4eg0Y7
 JdKrF8sIEcjNykXoGdCpCECqxIlFsSWnMIFtiKqrZMXsp4wRxrh0kpQNbpNYDQ/uwN+/qepfJqj
 vzowVPsK5X53XklQbCAYQfge72AOnflLBtGMZKnMyv0Cx7lgiyQymklw93F166v3csMn1UuoZXg
 ESLC3t3JBYKUZUcMIfAdjvQAT9A11Iu/ZlgxmxXw1vlTrAMjhh0etKwOyho50ZbS0qA2Dch16zG
 Ggt2aTLK5ywjiHK9agQ==
X-Proofpoint-ORIG-GUID: JswYja_yKOb93klfUS9Wrj4o1ktETQat
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0491ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kD_hoCCV8gRHnzEn8vMA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JswYja_yKOb93klfUS9Wrj4o1ktETQat
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXyCQwAbwWiCWq
 nvUqkdSIwLFwh9wz70SKPUAfXKpJ1uDoEGNhUTrdFSqAHOISB+x9J7HoOqeVCVVpEX12Zk0OIu9
 WSunKaZsiEkP763nqp67s9zYIDgIsjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 08:38:14, Krzysztof Kozlowski wrote:
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

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
