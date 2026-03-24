Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751532DAFDE
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343764; cv=none; b=J0k1PWz86Ib7nOSRdgJe4TyjXach4v+tLLdmyawv793YHd++WcR6zoFA6tPIwy6/fVtHBxXxmcJOkXO6JyT6kc6sn0T9bqN7TmuJT9uzvy48EbgBoabtiooxkLFG3SBAqgcJrTjcJHMK2oP8reLb+bcaz9aB+Cv1vqBae44dETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343764; c=relaxed/simple;
	bh=f90JFQAR7SS/6U0xp0rsw7H7Hgz1D1m1MVHNZhHxMUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/0Y5GRG71SP5nCIdgsgOQ8khFFF8zN0fB69dDVERdvCwaqgN5gSRbYCr5aZXjle+lnbCNmUqtCG/6wVk/FJ8sOAdNhowQF2ej4H0qB96PI9EWSNOHg1VVDzQfl1CWaYGBtOxaQKrGx+5RZHg8EBw2UrJGhKjIuOB7W93YrI/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onaQdV9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5hud3nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onaQdV9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5hud3nc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3pJAs1762739
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=; b=onaQdV9QwqnxdTNY
	ejmJu8ttuOsBE1hqTdPuoa2bOCgu1Xdxr0uLf4CrkZn7rqSnvmuKbAXTXH7efxMw
	+0MsYROLSoT4ybXN78pK7iViIjF6TyaJm8btamxUGlNhWqSY2vTpNPYwqETowg+6
	vfQabQlstDKotsdiHt8K6fsHQf7iumFZxtG8pKZUj6X2j5oqCINnFstIsilX1Rxl
	uOmnc5NHe23VQO1/rv9esXuo5DHtVFe4U4yfZp9CJWQGi6C2crr0cVWqR/wDfN65
	SASLNj0jje1OGh2lLqe6ljoZsuv4t1YhSqiLiYZLJVp9RjgfjZ/v381X+y6T6j7A
	HsjH8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0brxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:15:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so49508031cf.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343756; x=1774948556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=;
        b=B5hud3ncd78s5JJdUjBCjRi5q4OBHoIAvILgdm2FE9900rAI4w82hwGAcXOxodpu07
         bPASWGH0ZryDeb/0U4xFwBipBR+kdI8x1qbraf/W/qVCFPVBfl8adPJTTd1SK1zTstr6
         PHvbMoV5wF0NvJFyCHkXPGLt+MpCe56BrlOhTB99OCSz0BHxbjauGpcoi8CT/5BtNGIo
         YhqA/S3Ahwn6DYUVkLjOQJkmo3FIRQqGMD77jsA/pHsj+TNphY3oiDqmy8Gb4EUO58YG
         ISruOYw9o5+6e6u1jQCAU4MQFT4a+G4keIZ3EZJbFPMLGW1Cc9zn09WtgVkkEruk3ZsF
         wACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343756; x=1774948556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=;
        b=tJdaF+0xoX02W7Zzw/9Ev0AFY/ubsR5lAyUtEAKOP1OXQ0F+EzeUf1pm9EJWkXqSbr
         TNsrnx11tCuI+QcCwqfF81LUHiGhtelEaLsZ7vS+64AUSMS5X8qDZdAH+dbusYrPPkHr
         UxiuYF8MDshDvbrFMod1f8MR2TNL2QJkAl8FLdkD9vuUNQlEjVkRI8alk6fvw2A9BYIz
         cZH6GJ9z4YulqB54xueC5s94p9kDgJj6LesJsJcCEMWQCUjgjoSB4wk3SIlF+4PU9IXy
         SLeBQM0ancJpUTcGjpDmiSMIjixtz0q452BsxKcXE602/3ocA5YrBfh4emZ6rMfp1hWX
         VyqA==
X-Forwarded-Encrypted: i=1; AJvYcCXitelvHm/JDZnQr13T4GUBDdV6JS6SXj7U3r2p5bU8KHexOvz7b5TrnuskjWVgWGI63mPup0ctCCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9M/yzNzgpvC52nR6itevu5rlQuncTyo0ysPrm3MeZ8fIblfJ
	5Gkkw4Wsbk4CPrBK8NxYerWPrMxdOteA8e0+4Tm6gFep6vZzCwahGOtk/MKky997lXO+UiVk70a
	3GUyXwCG6BQbSvxmsSIrp9ObhZYgqUgXGuzzrsSe+aaTEi+NSGD+1Jrlrn86fVXg=
X-Gm-Gg: ATEYQzx+9u83V0wVI64i/oGcbfRzUIoXEHQ1PiuD0BQpqRUUXJJC2d+Bt/G7uuGwK6m
	KyKnOMLt7d8yb0I8FFg+GQQ5c3+nVjdVCHLqflL2fR4jJZ3QzjnaL+hz71FFEdhoYKsT/J0ubOl
	aRd9PgpILH6ItDWv1GNJgoU3jCzkGLCNWBUU1KBKK4QJDJFbUmHolPGNTu8/6Ihau4k44S4YxI+
	fnXbfjyIRdhmorBZB059PSS88bRGYWU5rQOap7iwH31t2LlAScp7Qwf2PhNep49CzI12eesi0DO
	4SLaI0Gnv+EY4O3fC+giH2Ade0D2z46n0i2wVNMYSFKSyrlsvm2tirk5yLTOrtxo4Yvxm0I3iuS
	0anw6i8r30YoW7c+d3Gj+PblQ6PWRjU6QSWBLqAD9HDMmL3F4+vViuZYuO6g+s3ZAWWWEWrnvHY
	vb6do=
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr175828381cf.0.1774343756379;
        Tue, 24 Mar 2026 02:15:56 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr175828011cf.0.1774343755849;
        Tue, 24 Mar 2026 02:15:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm488570666b.59.2026.03.24.02.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:15:55 -0700 (PDT)
Message-ID: <b195f47e-9bbe-4fa2-a29d-b24eefc94226@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c2564c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XNfRLA5X0yr4rW59EWkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4sPuhIs7kDAQNQYeoWRsomUa9-g_acAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MyBTYWx0ZWRfX9Oo4KhOU99B8
 Hb1xVObLAUzQPRPvu4geVvOvCv/GW77bxj++E8IpC1RS/CQZhJtay0VOO87dCq9Hjfsazsw8I1T
 9PwNyRTgcVxMzjmYpWPmje5hwZrWWEfkN1mm7szvn/lbn/QjDmxN/8t9ZBxawpQ3kYAc99VBnrW
 OJ8XBLI8veut1FAlgjr8zC08VuzyfQG66sPcYj6wj2WyTKFxSW/KDHeiLv59bd1iV2uG2SpL/vk
 GR9wXAc/a2tnXHQIjtBu4iHyCN3Zd53KivbmP6C/TVKesOpU6/c+hYjstByXtqOFzjtHy4+ETvj
 dZuHPhYKZzxIZLaSR97pxP7XixQTqOT1PS6SahMpf8FWQT81PNaqCt40ccXMQQCOk6pCIxBHDnG
 RliLzuw31L+Ff2n7TusZV/dsv9W7GvZHOUseW/lGdfHjQstQQ5/p3fvbnK2PWOtci7yIqnzL5Yq
 pBQMPieYXlStYgsgAOg==
X-Proofpoint-GUID: 4sPuhIs7kDAQNQYeoWRsomUa9-g_acAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240073

On 3/23/26 7:57 PM, Abel Vesa wrote:
> According to internal documentation, the UFS AXI PHY clock requires
> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> the UFS controller fails when operating in MCQ mode, which is already
> enabled in the device tree.
> 
> The UFS PHY ICE core clock already has this bit set, so apply the same
> configuration to the UFS PHY AXI clock.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
