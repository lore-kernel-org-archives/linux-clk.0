Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08BC40D572
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 22:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045068; cv=none; b=c2bSqbCv/vknxCpk17iEP3/JzsN0Max2bmNo2fdCOHjwtYIsc7FMe8J8GPPdaNg3wwNILljadpl+kUmUvbt8MN66xl0Uf4H6jgJQmlJEpaBjuP9dLiLJ3UAxLHzAsOzFoe5t67WD7TM1ZkFJhCC23xAkpNmwE9/vEp/2o0VPHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045068; c=relaxed/simple;
	bh=b1QsQawgbuLn9oDBIpfMHuUH3etBXQf7S4IHcuVmTfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhutpPIls9QqGE5l4O/PTWuY0Osv6dQ+eizJjf2CaAGrzpiA9U8l5NSIGU4Eo8RraK07L5cvteL71DCry3CI6n8xHWabd8YHmazdFUOLpFJVj+ykLH4TQV+sxSvDqDXkm7OJ+NLLbN6FNUF7aFLK25ZYIPMP0B4CV6RdR9HMN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVZX0trk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kt2yuGTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVZX0trk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kt2yuGTq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ME3Rr3502515
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 22:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zzd7A46gEHe0q2QQUgtIlo22
	z4kZx3py7wq1qUJgP84=; b=JVZX0trkHX/NEWC8ru2zdcL3JhWVjfWpxOKvadZ6
	GUwUuiRYCO1XQ4pbmYFZWr80r1PFWDTVUG/8r6eh105t2bsB+3H+To5AVLx7Wq+i
	xC6qzGdOzXuE6bqfpBgqIom0EylZ/CJ11IrGEoBBTNM1c9xQO7tdUPjB5z1fdmPR
	HrBMdCTy6yZyfLzK7UldnWyJ2K9PmZ+iQGVAtfOYiOnMekwnNxg8AAJYh72+KXFh
	j2e2fxGnauyCbfFzHvjjRJ4c1NOaw9zDGB3Jub/4YpcpW0yyTfNULqqwU8EMlfAt
	lEC31VrpNgUH5MYAOtughHK2WgVIbMMgg6OPw449Qv78gQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkp68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 22:44:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so2551250137.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781045065; x=1781649865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=Kt2yuGTqyCsDoYBBF7AykJc/bUzcshQJ1oRU8mlUT30wmgJ1PPy7EoEuE+GolvMzJ0
         lQHIjI/0ndgoy5SfuaKNGU0k0rMMRQ77ljxK1FrTq2/P7PjoEbZyputKVGTj7fEz66AE
         cfnOyH/W1tUi5925sOc/SeM1S2tBd2dw5ZWr9PVvGykPqHm4PeyOpDF1I9pfx2oOtz1L
         DbDp/FADMP1RpNGiDyGoq6SZgLvqTzf9UUfDsqIFu7cfSYs4fXcdC+RqmVv2yhz00ywJ
         jxCQD5omkCBK3EhKbfhHdBNNH+U/5v0/dY5BXBbd7R1bo6COSzLvDN8RGrdW+pECnVpJ
         hLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781045065; x=1781649865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=eyS/D1ofbyj3q45+JryA0byj7mfsUjPjNl8K30igR720mk5Pt9GDcZxy7wmg0LAJOm
         mmXZkXodXL7LqR2AlmcLZwifdLDHoTVMEg15NFvWYbFScREfa524GO0dO35q4dvEpJzW
         hqtmC68Xh+g1HJIhsrxJznxchRZcjcV8ALNAlCFb+4V1DEOsq5PmJR9EFhMqIyjrQtC0
         IRXWK/gAj8As24cdkofv83kZw/BJ2PUdttfXIhv3lOJpEvABZ2pxGpIA53k9c7jK4ytE
         +UXM3l3Ls2oLnzqnWCzyNP6RbZq9obkjRuqouM+cxVN1kbFuzYpGj4SX+9kW2cu12G8r
         kQBA==
X-Forwarded-Encrypted: i=1; AFNElJ8iqQlJNywfQ1cmC/+tZBAd0bF5vVGtgaO1v36+Jxmpid5hrQCXL8B4MzaeyMXtC5iiqp7aLiKZUQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTk3hxPDkq+0CcCamzzZWwuema8xrO38k11kYYrLVNRobIUjgi
	XAccye4eii1Shsfo0+ovX95DfdNnWsLeWJe4UfqFWBdbY7VI4lZCCOKqKqHF4IRAmqgaixR0Gyf
	e0hpwBIEgznKTSwJ+Fz3bxPZippoovLN8Qb18Mmxu+7ZVYG4Ljn41ohDHYuj/2w4=
X-Gm-Gg: Acq92OGsKvIHigy2/KxMOEoFSeaQiaaMzVIPrUK7JOi9w2qg5KCKABxHyU1K229A64J
	ijcuJj1tHNX0WvsFyUmbUCxTFMT3matSkQCZyLQMuqbYQLaA0sM4bKKhRYsU7RRWdlot44/9cPx
	qyn4q4rhuhPhSK0vL7m0Qb12GeVv9HAGPbc9Z1vFLXafl4KnQZ5sdyUjySpzoRLxsC6bI47eGz3
	KX1VAVaKps7zJaWAQ6TB4OVh2TJzxOgaPfwKSbF+OHMXJMq4/fW7nO//tOLKhttbjSxVNRA2bu9
	FxcoxCT2gcskZLGdqRVbhij6cvQ1RaqCQrpW661zzPQuv/84tq37q2RqMojYFg6RexmMWcwhYf9
	aCVFE34Iu/6+r3C9G2osroNZxsfNjwPPx4weg1FKyPX+hanAvwJIp3D5yBVPmgtX3F44NxS6KhY
	dka5YzYw==
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937892137.0.1781045065066;
        Tue, 09 Jun 2026 15:44:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937882137.0.1781045064675;
        Tue, 09 Jun 2026 15:44:24 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ec0sm57509621fa.33.2026.06.09.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:44:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:44:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Message-ID: <nnygotjru5ximoea73xhqwfjsjpditmhonvf7lmugn73dc3mqb@rl7agcusn5i5>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxNCBTYWx0ZWRfXx8GFzT5wUBcw
 ogGH7FhIC26hk2/7EjPmFs/qELjIIQ46+GFy94Qxqxw5PeeGcXfK8PkRa9ohE1/ChCBFdBfSqMb
 oH0zSPSGxNXDiGErg7+pSd21ZKwabltORYERcRsSL8XD0SuxTI4AxH5xHH0HCWYcqYosbr8LbE5
 aF5iALcjmwdCV1onOSScIASftvpRFNt2TlSthYQX9Fxwx93PoXtlKtyfMXWEfoodkr8wss2nKRo
 Il+tOnE0K7I3GIJm6LJJDMF2vYvIMbkpehT+TiH65iv5Iyh9yy9fELnmHjtKYAs2zuA6r1BEJxr
 4mrM7AyuOdQjlK14oQi2OvHqQH2XhyUeRKNewK2WYP+SVrr5mQXq7k3XWPX8tlIgQcbupKP/BTv
 EQr1CI2D32U9Vn2FqveOFgTrTx5SFHCkwno0CQtoB42zSomoJYBoORVHid/XW2BVZjZaam2A7OC
 Tnye7A8xqotIxd7ZvwQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a28974a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: YOw1LtI9tBLUyBte5jLzVE1B0GoVfUGZ
X-Proofpoint-ORIG-GUID: YOw1LtI9tBLUyBte5jLzVE1B0GoVfUGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090214

On Tue, Jun 09, 2026 at 05:32:36PM +0200, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
