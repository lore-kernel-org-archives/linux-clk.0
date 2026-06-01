Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7D379C22
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315669; cv=none; b=GslSPXK8RVsairCGKTC0gXm1ufBbkPzDqZcA7Ah6SpjV6dSdpSOKnYVLoil8CDNfZ52XMSBZcmauxRGVUMiHQLY09ESsgsdQHU/SH//xz51tVXral0yNjt6Ttl3Hqhi0sqH6v2EjgrfR5xib9tEg3XFzKrAITF8mrU9ocVCb+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315669; c=relaxed/simple;
	bh=zs0qdbXs2x30afTWW7YL6ZC9DLX82eZT/SOhbldZUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5hyMwQz2nYx58OpY/AitslFWa0KjTzq4hhpWWSJfbSm/5mbS/JMY0E3ckIZSyRPBksHPpMpKGZbK0S3IUvrgU7+Q5dB/YyfPvkIZo+4CwBhvR8p/5wqQ6ALITEVwLHFwGk9ruHrjM+iRrZKPRUNxcBrBWtK6qQPvdGK4alTNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOkbTG24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPzqCtUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOkbTG24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPzqCtUT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fLrq144982
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 12:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv11lKJOxLoelkQcyG8M51LX
	H0JVFSvQtsQEal0SIx0=; b=YOkbTG24moufP5CdBcqmMwE9sLCpQl45J7dEwBT8
	f+iuJCMLrmkN3vziDKDfcPRPTGeeJqfmP4N67LZIJik6PvBnTPK6b5JjrhMpOPy8
	qaT0kZ65/fkIpMUjSKkwvhpTTW05D37684pzg40tU24lK5tLCcKtF2vKtIULHQ9P
	7hwSeO2F/0XOyb80YXw2B7gODzRsq6+7nfxlDy9KpYVin+bhDBl9RqtQN6cWlG/9
	aXTlxrp+e0Bdby+gBscZ//Q33Yddd70HtNXNbNZib7Ct+pDNa0KRFolOJJGFEZu0
	laK7XZUa9o2wg2Ljsc4dfe5oi3gBuln1DW7jCU4TLNQt5A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6strt65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 12:07:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59eb5407c95so885971e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315667; x=1780920467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=PPzqCtUT3Zc8cAASTt9DGaY0iCvmJEkifPkKjE9xKR95cWEVpaUwtnL8ZGo324jy9F
         pHXDlKq1Db2le1+Ggy00cBvbocHtwqm9TSaEdXJjf6cFxW9m8FkmCUFXZzpSuZh21qIN
         3qgyLHTrEjiSMp304UPdOQ8HkEkutFs+8G0NxjA1Yuf/4JglNSGmsJtK5ssl9pY+p+1l
         5DFbWUuoxNiiy/4F1Gi9lYRSZytNB7LP8pDX4YhWNrEG2sJm0HeO8cVd6Cv77DV2/KWy
         zfB4LxkxM96VHNL+2AV/Hi+b+2bT6n6WyuLQ1xYJOINrBOUXiyllNX/uYsRFDwvmu/KC
         WnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315667; x=1780920467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=LxQq2nkJ0sK8wKv2IIrxYeoUQDFTdrcaGC6O4GuI9t1OaoBHSGFM4hhWZsJPUN3WlH
         uPlGJb0OnDx0AnL4aDl5xiegaFgSj9KRAXcsL1/Pl/B/P9/nYN1JZTXGxg4WdGAo3gsb
         HdrYfUV2eaZk3zMDIBCTg9Q5exalO3bpn3FZpJbHpomu/m46AL7flJZ3vknQ2guo7O3f
         5gJ8dAYO9eOuNBkzfrJf7dt7INSW1bcrGnkhBG6crHKQWCw5dgFAEuLnywchrL8QYaqy
         xOqd5JPo5WUxm0KwCOCjtFkPxAVsqPfoat6CmA8N1lCTJViUmF48jNk9E6ZayzoxnK2L
         7dMQ==
X-Forwarded-Encrypted: i=1; AFNElJ97w2RrG0HCqUhliPbru0RjtojenwuQsM6ktW+tLcuC2vWJ7xHy6nXd4keTfLg5z4Ka0+sApaUwA7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KaJT5M8gm8R6MVvnkdm5yIK9k0ZDNZqaFAm53V5qT7+rRJCL
	i7TeymdgKPsl48zWDJXUlBNIzUN6wq3YtdJtHwUhDESWq/jIl0C9fsjRDw+ncqru7KOR0VtJCha
	hGC/YDUL3LSruHj0k7UIVFK4cDdufvQPVLB6qR5FWGvDjrzxvDSl7bbV5mNbDZUc=
X-Gm-Gg: Acq92OEyhS11wIGy+dhIh45gN9XwPtDcM4aR9kjUlA/qsTczKE1QghGq3PSv8SLGNYP
	o+J2uV6WLjX3yRH8SX5mu/IuBDYazHgHti1/RGm8ES3CmwFT6bmAgLHr0D8QE+aiIYwJ19CywHm
	dFRdQaZySdiRBZm6QaBlzeEmFC0n5bUsp8y+no1EGAR2nzbXACA+iRSagvAUb7PXhNGQYl8CnPQ
	FRkyPLmfRO6yXDI25rkigHaflrKY936eJoMlrTK4VtK7n6/uvq3ZMbUrkOTbfAddDBR9VgDKgRL
	y6eJOgmLGQeqc25phgiUzowAt/eUzK9I4CiYXYSLtVaBe3S9+4J+32KT7ZcsCrgCm7XEiu1lMi+
	Lq+TafADe7hOGz41B8DHRoUKp2CtgYQoknbLYwv3+Crj8E9ok0k2X+aiYmv7mN/5RXfM5RW71FS
	rDCUmBgzCS93K2ZJkUWuekh2h3mtt0tAyr2SbfxV9Zk92uMA==
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683595e0c.10.1780315667150;
        Mon, 01 Jun 2026 05:07:47 -0700 (PDT)
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683042e0c.10.1780315663363;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm1516467e87.4.2026.06.01.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:07:42 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:07:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Message-ID: <vsbimklkzmee63nfwpnx2b7dtlilfcaqwv6d3gj4xkmm6x7hpd@rdc75raf7q4b>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfX64q2XsF++4Zu
 tzYTKNRHo8PtlVu4/kqGfMvMYx3S2yj/wh4lDxWZvYtgUXttBQC7YiWROLrQKz4E5sE6zoDvR8+
 0Sp+Rh1A1VzBBJheDbiPhxTt3XJH3Fu0SmWcogcq+L0ezkYVZ6m3RKrGLjsih/cnkgqqpQv/4VH
 ZO2eBGPIU2E3hTmq93RF3yNTwhH7E4U74OcWcqEaORdbYbNyqLYdC7dVqwUM3+qVcwvH8DyvP2g
 lZO1BsO/S/+niZZuse7YCSiDlsNaTWSnvE7RwhSyXkBsfR0TYHnaVFfueH27Ksh6lVJF07+q9kk
 Ax78fxm8ljh+74RVe5athfZTNmTaxULXjhp858yrFkJDI2Euck3qdZHHVG7we2psvRoTUJyjxVj
 0gEiNFzxCsh5uNJqi7uIkknDql5J5ga93BtfA44ZG5O/XmN/ezxHVFxVoTeHhcqwkYNAOaygNHe
 H5x6bCceQ4aHdS4XN2Q==
X-Proofpoint-ORIG-GUID: iFuAkAs0UT3R2NHtyUhnwvN9R55tHtdp
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d7614 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Li_iKjNru-aZ8oNNNaIA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: iFuAkAs0UT3R2NHtyUhnwvN9R55tHtdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010121

On Mon, Jun 01, 2026 at 03:51:23PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
