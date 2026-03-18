Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DB3EDAB6
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851839; cv=none; b=c+tZ9rDSTelbCwu8dJaDTDyzmWBcac9FkwjvyOtYJuICP67JQC97qOzQemfzcjs9mydTCh7DELchahc6OSSKDLOmJl5Z7muXHLZy5i+8rd4loH0brjeYg/XLaEMitzBmmF91Ir/6vfdEiG3iAuscrXl82Q8mEizwE8yhhCNSiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851839; c=relaxed/simple;
	bh=cNmiagvpItNjpR2jJijzr0scGysr1BHS9wTSy+mUF0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5dHshnfsZkV1sK2MRoYMRyAM4gMxM9yEAlRsVLi7hNStTl2AmOpMWeWYntufEYuGlX3Z6JOrSApDkzgg2P8iWdX/rcF1Ig6bsbBLM7qkZa+2AAZe9Z3P6gcEyy5Jg+qsIu5Tnp74t20lw0AfR37cXnChUheFBf37k1SyeucmTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+jKua1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juOECeQA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+jKua1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juOECeQA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IGNhC2004981
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qko/YRXofL0g7xK31fRPrNzf
	jiKro7Z+in3JRlMOoE0=; b=S+jKua1ES82ossdgH1hPCw4HPR239ijv3WGXmk0p
	iN18XhT4T+64frVMobCY/kpiwPx9t7/a+5D7FynGCL33iokELy26eHx8U36fh7q+
	F6QKQYijdPZIcAyOAmqiGeZnwIOW96RO/YRVB4No6kPsg7c/RdxD/k9qOHaTQEku
	Ud0m+Uhfk5g/i8P8c4oDWXWXbWAP74ORPa13QkJRG2jhw0Qsc3ttNT40MwYzSngT
	4PLDmY+7RCPOm0e212i3Qv9D90S2hNah3VQg7TuhYOtw7UO1+8nRGDhCeJH3iOR7
	DxcSf1eNEa+fqwW7KVoTwwR6Ly/fUDVbza21Y1fnby4JNg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhg81hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:37:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c56300e64so12344716d6.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773851835; x=1774456635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=juOECeQAEaNFg61jiFgCSha2UpU7e1vonTRgsu+WTvLrnCkSFKfMtOz6kwPd7tgFVx
         te1QPMwvmvHvb2Z2BLB640lilquspUaexGkeE/2hjssuVawjH/ub9skRNjWGiknx2Do6
         N8fdZpqbn5ttWc8MwrJME1kIsTv47jd5JFr2rFmlLnj9/cmdzHDKrgnTRJcRZ0mWXtMy
         mBujrzv/a04gCcvXyEQ9l4vLoPtcNT63MMRMNdIALAqa7tTLIWKxVU6GFaU9aWcl9e3G
         9tHCgSncjeUuOLBV7TAoEbISkKTZODGxM5znfwYiaTcQcATq8ULJZFYn3bDR9zyFRjlp
         LGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851835; x=1774456635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=Z3VYQnO7JF8YzZvBijaEsT3hr01vNI7BNIN9VHoEsz/a2Pp5UPGlKoRJ1oSf0ON2R/
         /5K6dFJCOLyFl8QexQRjHgYg84Mzbw35Js0jM7Q32H+AstrynrwsO4aMAL/utHqycp40
         +9Mrw6d9lwhhyu4N9pbGvmzwZw2fWACKIvPV/13R3Q42cr4lQyh9/+jNcsiQF/foZeKj
         3WIUWJZS/4bze4LSg8+5kDogWI6Nq16kJQECKx83tDOy+LiUroX2yHzAEq6jtCRzif9n
         AaRbr8tsHiGCyrzYrcpPM1nX36xVC1pjlZXJYIFe5oeU1nfejOh43FnwvaziGQ0OEubo
         LGHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWZ5Eljyr/gLTaw0+02zgdAS35xzpZcLfIpgSTgpiuLAXjhkCK/yP1qA/ViHL+PrgrMOaJlKQFCig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjlrSo7/iqndCiNxALhvhcZWyKEDpK9sud7sjjrWoxFGjFiiX
	g3Nbgs023/p4bJ6ndpcbuIWFXHjq1lCNNKbRbkVpH1Bw0blkrFfx6VGijSbFfQQP4Ew50FebLzz
	9Fa6DG6R/6ActX4hv8p1uznNyQ+T+l09yoIezpUZPAM5bvEibHiDd0oOrByNfoGw=
X-Gm-Gg: ATEYQzxhDC79uzL3KqnXsQHdP3eXIuO89TF3rYTBWSyP/jq6d+opc1rjR8P9UOXsvST
	bo8bslxTS2YS+xypGA9AOXsS7/AgfmtDegs1rQOWOrJCbsxL+NbRqy7Fhbme4x+WYRT506ve5dp
	jWP/uCO/GN+wmGvTry/15e0uCIoJhf0fl0VtT9nK2SB/zrH9S1yjl4mRMgk1WqqlBkeeHarBdFA
	QYrfNNjom2MbtZgehjXsn98KhpDVzmw06p7m9wkuCmp1Ar3PNq6r1z67/1GrMkrxGlKulcQyVkd
	TDc+8gz/v0FKbdZRS388h8vXjdieB/FQ0r5hmdwHfAZk0BzwC4y+22gWurAf0nWOqSlPoXmiZZA
	N95R3OwAm9TzTrDswMtm6hl0YSgrmbzWoLw==
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661771cf.62.1773851834679;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661201cf.62.1773851834101;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53153sm2136765e9.13.2026.03.18.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:37:12 -0700 (PDT)
Date: Wed, 18 Mar 2026 18:37:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <sfo2ib7segaqnpzd3u22k42od5cp4mrz72h3nwp2ihrds7l7uk@6xvkvonk2sg4>
References: <20260212235842.85934-1-dakr@kernel.org>
 <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
 <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0MiBTYWx0ZWRfX55kHHOYbAeM6
 HPtwKQh48p2JD+M1U+4qanVknn16CgiQyuLOo8PbeMlTcyewJyZ0ty+VfT9d6K9eZKrrXaNKINS
 fMij8M3CnUXmlhpEHQdt+zAsfaHCr0ZOKmNTf8oG69R+Dk+gUZNLXTyjRk7USMrGO0ksTKfFko4
 nky9FUa9bqG0KMyG7NwzcFh3FFpiP7+FX+NPLdL8737exo5n/mEgS5SUjzGs80ljHVwIGh2v20N
 PgZeozhLMlIW+tZnGxzHbHX8Ze+WCE9XhPhPcRzl8xGHjze0nTkKCskaRdDBlKYxYTwsn3XFJd3
 VHU5T6BOL2Icp4NSzUFsV6oY2v75c9IJRHkCMA9IjQ/JHROaovtgVirkSZrN5mG9dpc59Bm5fmr
 o6oeN/5WxtZPvaIT8XGU0ynrOoc0RZj3w2SzR8iuQYNld2yQVv8Y9pAN3LQ7a4J8kMFsGg2kJEF
 v/brfHrADO4Nrshx51Q==
X-Proofpoint-ORIG-GUID: CSWVKVTUGWiaeZ952n4-q34Mdi1L0zSS
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bad4bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CELFId4UG5F86OlxqCwA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: CSWVKVTUGWiaeZ952n4-q34Mdi1L0zSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180142

On 26-03-18 16:42:49, Danilo Krummrich wrote:
> On Wed Mar 18, 2026 at 4:39 PM CET, Abel Vesa wrote:
> >
> > On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> >> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> >> called from IMX driver's probe() callbacks.
> >> 
> >> However, it neither makes sense to register drivers from probe()
> >> callbacks of other drivers, nor does the driver core allow registering
> >> drivers with a device lock already being held.
> >> 
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] clk: scu/imx8qxp: do not register driver in probe()
> >       commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9
> 
> This is already in Linus' tree, you gave your ACK in [1] for me to take it
> through the driver-core tree.

Will drop from my tree then. Sorry about that.

Thanks for pointing this out.
