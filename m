Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640E362152
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478115; cv=none; b=Bmf+6khWmhSBsiGGqAyQFAACiwQBze4BgJhPTncnQjH7Sbn028BcgAQ1Grq9Lg4lNNPz4ICi79Hi3GYHSXuk6Q0KthzFvjL+5zxOFW0EQuFRgGLqUkfrByKQCgJcH0LWAjAi7Jq8DVdhex5idCsM2BQVR6TAqISfYbj6/a6FIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478115; c=relaxed/simple;
	bh=4koTP5jKH+89y94Q13gGsMfnyEYNS1LKPsDEHpDwMTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJh1/rFEfHWuOq87SQo01HoZwl4VLkIMuwg+xwMYPptrn8vAuJcZ8mkold3M74JOKLTmqYSpUpoP8TcGASNuGsij8jULwsqdXN57b/PBTMrQIy1DXjYiOKCcvpKDGx1+m1irGEeMjpoIC1Y397SzTOkUJ1pa4Yweji2/yyD6Lcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuhCPkWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7yjsHyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuhCPkWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7yjsHyf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5HZ3j3235817
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 06:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=; b=fuhCPkWiq6znrEi8
	gO4rczS0y/g9bmb7dgh3NDLfYz/8F2YgT3hv97u/2QtrTYrwBpuCU6+6F/L9tF2V
	Loc9Pj/a/R0fJfoDlLqs/S2JooRp47OuaBs7faAixf46LlIJNIQdubNGUVbldMm5
	HawfSG2nGA9HXGP8eMJOERXttxEbyBgT23eq7VNx8mEU2Q12/AN1HeLbkpUtXMTx
	kCjpCN6vJq80MWMUXjghoXQLwp55AvhqG4VS2YLtz3d5zmlXyLoBjCNTQjs6VKYC
	e7qoMKoADmFTeWXO6kwQGrkEnz00emHOVUTk38kXP+fSLrlB0MU3cetuyWYkHuLr
	X4WKQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frne505tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 06:08:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so5869351cf.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 23:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478111; x=1786082911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=;
        b=B7yjsHyfH4vE9IkHGbbyS+RKEW1uJZKJuLvRAu5k9nmpypA+n8QvNeGTwOPty7gNrC
         uaBeJv+ey0O80j4GP9PAVMLGlQE+HDEgZ7RQG6wqKrvt84lwjiMS7EPeEKcYKvcxXNYR
         7nt9AFG+CGI7y89jUWAks1yApdb3nxu0u4n5nqabyDlKhGTi5XuLg4vVQhpbpc6dxZY7
         uKkZrwT0QhsfIPw/oXFZtQCa9OlJIHK99kjHkhUI26+OXED8JFO3iBlvF6znSK582CWW
         O6y4PeJ7PWgRW3hWMT3Zq9nrErWoW7R/EmDTTXK7AQffJ307GRVgblB1y1V1QWrcmn1p
         31hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478111; x=1786082911;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=;
        b=ARUYRRAcpVrF2zAbqD+yoXN9bQXJ+CJ7G7BPQPrFfPJ4Jx4C0kxW22T72rdUbroBLX
         yrHL77z6UGtkS3MFaQzeGiPlnxWUJXEhTdh4aVCjprgl/fDMP/07YN9luRceOIAZuY+n
         fGb3mHxSBZzm3VHTJzciyVePI2OLgkr6O4YNrZxdkVcQ5CzTAahtQ9Brd69vhps1Z3J2
         nOTUVo240Me2197ADmR4hAnYOK4lF311F4txiVPJxfLRWsGGTR394FulHpaGLTgnUivC
         PDGce2ithq6BlnXyxQW9d6wfHSyDm+uKZhh6ZjnVxkVMLqxkyFdETWJ/td+HVHlY0Xv5
         MnLA==
X-Forwarded-Encrypted: i=1; AHgh+RplXV2w+8tyLgQK7I2tOtH+L6XCNspLHfAEwSol0XPdshGHg6falOhO7P0LvzAvqI0FaoUgKJd+cnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgoKvZk/Z99UzHeTp6i6k5kG6sJGH+08tbFwCFkKoNzQyWbbs
	ggdjm/dOKbR/MozjfYfQx66kKLyY40VyyBReEdwI1J49CIX17feA/IN9BRGTMmdL0v7IgXDxahN
	OcpTsICRtwnOIIxcZpDC0IqfqgjTpyzng+F1SuD40HC5N5X7HQp35HlpkHIFYx0E=
X-Gm-Gg: AR+sD11CaxCXaU0IHGNZ6Ad9LNXoWAs7IfvbXbMvytC6q0W5m/UXbJStX5amjFZDbjS
	jxf90S4KBw6pFPTZVsTiHc8pGtSba5gqY1VZ0J93zhIqnJ0bx3nHeGS/bvCy2lU/zaCgTikp8Tc
	W0vkb90lRc6Z/NsRm3J0z6jXwlnA96vD4N/1uMDAapMGNjCs8V0O0WeoBeigrGzHs/cJO6rD/nt
	TNfcK0m1UiAjFtBXK+8hZ86X5SKdq09QpyitG36utJ86vTPMYbsUpOQ/BNAjr0dyhTNM0IokVS5
	Rv9nTmzszCMRBU0whVdHNqBfRu8pYQTgbUQiRI6+SWmPNVhacv2GBQtMqKla4PD0IxHrbRApHb4
	e7stLnmvwmfShhIuRopaSqow+sSCW4g==
X-Received: by 2002:a05:622a:2282:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52b4afdfb40mr8161271cf.2.1785478111020;
        Thu, 30 Jul 2026 23:08:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52b4afdfb40mr8160821cf.2.1785478110472;
        Thu, 30 Jul 2026 23:08:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd45202c4sm24033166b.48.2026.07.30.23.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:08:29 -0700 (PDT)
Message-ID: <d986debd-fc19-4e42-9470-79b0da2fcd2d@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:08:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: Brian Masney <bmasney@redhat.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
        cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
        cy.huang@realtek.com, stanley_chang@realtek.com
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
 <amt7w327inR5rZrU@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <amt7w327inR5rZrU@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ftzsol4f c=1 sm=1 tr=0 ts=6a6c3be0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=n9Sqmae0AAAA:8 a=VwQbUJbxAAAA:8 a=svCZIhgI9wkr-lvpYL8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX9BaPZDLQBas4
 NKHQpRqn57ZCGiwpR8LOJ1hYnZQJ+nFvjILS28J0uUVPb2PzR+ecoxC+rvJGacCdUQIrBoP25Iv
 kxJMLQRjeGZyGk5mJaDHtV3cxeEDWhM=
X-Proofpoint-ORIG-GUID: 9GxSUcGl6ZoLEuGW8spOGSPnLmS3inct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX4qUdJibYDd2s
 9t/VMIWd9DAUk80XxXIqyckf9vNRLsacMfU/WHLf27oBnvBN/FQN5lydhXBUwJJKnE1L1tffXOx
 6I0vlm38Twe3NTyV9JxdYtQ1TkRq0VJPEQTJ+h1I+6DLvA35G7isbyZHqICk+y1zakvugGsd3Dg
 n/+oQE70vXfICouKRsSWKxImek31txSJ/nEHDsbbITtOwfvsuMhYnhyfUhOPVSGUBaoD9eJch6/
 6vSdnapQLa/yOCqSf1vZ5nCYCjGuM0Ziqv8Tx2+0nakO+kEQS3ue1inx6mqXz1kuW4I2Zs7TMN3
 QKbWM3uPR6PgoofU1m6rGSbGcGZU24qprv7R4OrMUqeDfgwrMB23+RVAMZkRuOT6ivcVU0w1U/h
 NxqwKCaOYs4n6m7cen9h/x8g79R5gXx3GuHk5YB4uKNZ/MlYZ2dnm/Vg/XZUGLWsOyiEiEN3Y4L
 Xps0tupX95Ag89Qf+4w==
X-Proofpoint-GUID: 9GxSUcGl6ZoLEuGW8spOGSPnLmS3inct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040

On 30/07/2026 18:28, Brian Masney wrote:
> Hi Yu-Chun,
> 
> On Tue, Jul 28, 2026 at 10:27:56PM +0800, Yu-Chun Lin wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2f9472c1a090..65dd2be63903 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22741,6 +22741,16 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>>  F:	drivers/net/dsa/realtek/*
>>  
>> +REALTEK SOC CLOCK AND RESET DRIVERS
>> +M:	Cheng-Yu Lee <cylee12@realtek.com>
>> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>> +L:	devicetree@vger.kernel.org
> 
> You add drivers to this list later in the series.
> devicetree@vger.kernel.org shouldn't be listed here so that the list is
> not CCed for just driver changes. It'll get picked up if someone is
> making changes to the dt-bindings via the "OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS" entry.

Both lists should not be listed. Both are pointless, but of course DT
list is plain wrong.

Best regards,
Krzysztof
