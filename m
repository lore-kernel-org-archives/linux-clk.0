Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3002239068
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954328; cv=none; b=QCvz+6DpqiTVoKsNXV5o1vJ82SoOO3qd3B81lGigJAFUbX5eTg3oSpLkMV17H7XRWfudpK/17F2cUGAVuGGTJ86UT3ihvoIeZgoD9mSdbUHVSe2GJ9Rtg+7ZHtUVD0Llw3uCqm9wKUrzZkRTv2zxCA3BTXQYYflFyqP13ggNXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954328; c=relaxed/simple;
	bh=w8t0PcgJAx9ctFVVcRI8rM3BIltwafJlxl9b/hayqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPkSk/rJ0+1WVft1VkdIbshnWGFYzG50Tv3WRD5E7TYqeQRY8zw/oEYYsT/YhwbFmyNOEY/UwJOjZe4SHiYb3FAHiD0lohpX7gtlWsNfoflML2UK6BiEm+oLGvGfRNhsmaT0XTcpjCJB7tzwpfVZqDufo5QnQyZx0vHEPY5Z4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVctFaCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8c4ONAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVctFaCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8c4ONAq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUIb21144587
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZd03ZLm04N2hieg4Jz7IpXL
	9lB9dSQLJ9uFkAaXkhQ=; b=WVctFaCMOilWNlc2G3VjyRltEj9cnMnJrXHG4PRE
	3iBbZuR2pwOkRuoowtaf+axjvSB1gbBmVr3VJh4xugJ45VFFezVSEZ1NfqxdxpT9
	1hYut6M97u5llEel2Xtp3bfqf60yRduELQqSPf2/S8mNi7NCLJPQuhwPW7JbliFB
	8SvmZjpWb24yxcJgOH2GZgj/LajfuywIoc5M2XhyO1szDqeqT03H8MRNrPDgEcay
	SFeg5kxiQOyGstsWMB9caO5BA8a4NT96/HGJlgzMcPIN8thesYIf/H+tlQgc6L4n
	wVy4I2iHyXFCpdERKUB2USqbyxczhJCiD+22WHLjpBHv1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp420b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 11:45:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so590959785a.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954325; x=1789559125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=i8c4ONAqNt9xcGUmrPw6MRtEPefogLL5ki1fQXklmjaVZa6I+rM+IUXGjulnhGRzmN
         z352dWswf/zIB9YK243UKSj/CG6Xwf0WFcmE2MkMmELeFpfZILTJw/FPKul6SChsRRAX
         Ij6G2mXipUjvPObSzx8AH1flpmpyjBEK4B8pRdyGZOs2k77j8+Xv/rAfv38JkfwThYSC
         /MpPvHMVFiZ3D6lSq84/YHVXD2Ftj8bMfV31z91OuwH5AeehtwxDHHBtGVQ2ScfwWiuu
         VenlmIPK9iBDk+ywp0Eki6+AicNADu6txNoqASobxiFj9dZh43jeqLpqG7hpqsVfk4bg
         EKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954325; x=1789559125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=qhJ9R8uw3kWXuW7H7LV1dNpU8lc3yb/wWgX6cun5Ehqs/2wxnlLIorczbmVvmFlFhQ
         UFrMoUnOdOgdPj3+fnmTHNA1kVYtEOZNWTIh+uOXwbfsz/tex78DJGjig1GhQZw+POtJ
         BmnXeYTkwYILQZ3T3cMXS9gavX4KadyHKBfJYykfQv0wrrV20JybfRn1xrtREYlAz39g
         uS9qw/F6GXBho47qvSWSXvGExVlXftpjjEogHTTXeiEIRwI8JBkVklycvRyln8wI2Lhi
         QXQGUbO8Q7AYbkoGEjA98X7+KJTcFQXPp+I6HRpUpCXbvvL+liGHlioBzdR3LHhaV4+Q
         etpw==
X-Forwarded-Encrypted: i=1; AKwUvBylhOd8L4wURKqdZOsQVYdjdAjoq89dmFccQYF9TaVtqWbJ6jlSGoe5LGAYgjnhlfM2qyHr/TsTUPY=@vger.kernel.org
X-Gm-Message-State: AFuF++k0NjGSp96tTKh1FyniXXWxtOtyg+a/6Pnr2eebwja0BETXH9Rl
	h9qSvu9JYc7uF19OvuZs0eov0CcQR4TnJ4/kX2bMuuxPbgKeLzg2JZHa4rRVHzz1UTWScMs0mys
	4kwN35dGJi0qkTZlZSC7t9TSzfmcHVeCvv2xdHzJuAJirQ7dFp/r/KOAXcX6RKZE=
X-Gm-Gg: AYBFou1jKITWJ7xclH6Kce7tAkBby6dk+nKbrXgY09HyskZ13lNEko/DTQu//vl1jDr
	3kVd8FCt/Qm8HoGnIX1+xxvBl0m0IqrQ0T1wzVRer06tbccSEU10hyPq/mULZFOJjdRA2bi1Gm8
	v8T4t8CitoXfkpeFUREJtWb/Un8oyG7RVmrEMxzwynqy/IdnPoZ+xvczXd0aeAJ1ca2NEINOLf0
	jA+k7SQyoJP52aigPWWg6Qngnq8thoLg/hTSWkl0K44EYuR/YlQea/lMqVah4UIf56221KHs/XM
	NJ2V7Zw+532HMkv720J/qCtPVto642MxFaxB+VYqLsW/bU1cHmHqD0OYll0Oisj3g6BkVNvRJov
	h7ppNmsfilDg=
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721123685a.40.1788954324792;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721115185a.40.1788954324141;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm412127415e9.2.2026.09.09.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:45:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:45:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: lMbZChod-Prn1VSY9BrQZ8lLsts_tKJy
X-Proofpoint-ORIG-GUID: lMbZChod-Prn1VSY9BrQZ8lLsts_tKJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5yn0zXb1gEym
 84p54DsIFutnRDvUdJ2eqRUqrOtq9x7Zt1zVxXXTs2gCKOTysWyi8oyasZavsLZ/V/U8FfgPCxs
 iXBY5NW4FZNhWfwOEAybz6ynbQ3tUMD/qkzqCO7BTSHOPKDDd0JWmTYJDiHj/Dk9XRkN34QwY4h
 zrzO8rcpHsLsmx4WYZLlc7EiO6NtO4kONpmO2KcITl8/ZxzTc0UL6FjmX900py/qNQ53fJpkFSv
 HoHtPuu/uj+2ek54rX/dT/cSSLGsicPiuBbDWuEOJyRq304pO3/viHVv6pB/YXaRyK+maRb2xhW
 cuFkUZLpdLm22aMIFltJ2zhaW0yWY5xCg1K3gmJATeeG9iK2e1RvrAe7knb9iLSvYCh8jzozM1t
 xRj+GHxyP+Jp8cA5EwhOU4tkTaT0yBtzov0KRuUv88K15nmLYX5BzEJJSOl0NiJTV1t2n2j19ev
 BNGlxCQ5l9m8N3jJbDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX/FnnyRy2lx3m
 9a6IrkOLX8kaSyL0x3LvCY4mcpeAsfepga4B1XSXyUl6HwMDPA3Dxlp3ZfCn9DDMvILuzNNeRP6
 Ei5vcbuYFJp1p6EAcde5R8FXylqaP6Y=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa146d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:20, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
