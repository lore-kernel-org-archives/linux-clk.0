Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498959;
	b=aTeJSDyU0KpASmG+EREOlFd6VUPFRnm5px7Dp7PQ1qWxawH2pMM/evF/Tfz5DfWo1wRH
	 ap60+ep4OPM+4oIy/pvhVfj704hVKnV85V5rEHgDcQL0oMpAfBFpIbhmrNzk9c+4Xqxtl
	 dltp9vouohQeo23hHLQaqzpvkCtKWuIQQZW76fZ+T9CYdWcTFLrIaPSiyJE/rtcMuZEtR
	 0G7F94GHjn4FUSXEFcbNUMLY6GjO7QNECA4WeYTi1ewA/DVK5R2aBWNLO2kykoCI4KPtN
	 +g1eP5MxiuHLDCz7yM/1b7/fzFB3phQOg9vcQSucXRKd9ph3WYMZ52KZdjiCs5wXagg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
	b=4mVLHdmg4krO2nMU0r5bz4tjdSrGY/8tWBaHVmtYRBMoSGfzaMs98EnCI4dV342T68MH
	 V17KBubDS5TPPJ7hP46MCCjoP21jfP+a18+GDVdIeoSsZk6JAzIR+8oxkFJNtsCrc+JRK
	 p//iV+OfJoS6JesCX1YqEGTyiW/o5X3MutZ4M4vumLhzl16D3U+98uIqWhwd6qS9cszSW
	 TT86iGdNcmuIteRbjLs0NohjIPZ0K8fiuY/IYdXcLiBU/3YtVUbfTK1PQjsoYsaO+Z8gY
	 1/fmnRb/do73SJRnnE2LHDlCRKdURbFatgDjV6K7Q/gZlBnWYLiDT6oSt5GiOyAEsyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QhvSsuFd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRj8XSIm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF1606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BF1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QhvSsuFd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRj8XSIm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lerH1598169
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mtcw8jsnHYBk0jWraJ4U2o4b
	44X1RjgMIXhXbWzQwx4=; b=QhvSsuFdGpMT+zoH2CvNRzS0chxwt8vs0heppssX
	K/gWUKFlvZ1JXn9msOuPnmpV2TosJDCK1ogcuClPQSRWCfzC97Jj2LhoWGehygrs
	OAjZh/B4TkLEmJc9cUl2fvqWOSjd+EbxRMRxcuEs532C2DFuLrbTjpbkG34Y30j0
	c7I96tGWJBP1f8NIIokG/tTYuL29fwHCAfQ/Prr9c+aF9/1DmHJr3juigDbIfjA6
	GRViufdMYchf2mb6YsRbZoDsrEQSwQ2Emjf++LzxDIwcVu9xMuuq/q5DZjIsRSBF
	PjRkgmLyFZeanOgTGYbunISiUnEZ+289Mm3+wk7WMXycVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqhyry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:42:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92137a721c7so69844726d6.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795498957; x=1796103757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
        b=IRj8XSImy4BV4vcxHwNHQkoapEP81vgFf0Ssp1qytES1XEXtoCFHg9AAKL30ewf+pT
         c2TyvdrpUgMRSgiYpfIErWTIndVG3v5HUx1Flfv1ph+lnL8wbVvQUPAa2voLvxYrWTKJ
         O7naYKgl0XpD4AYh6ULeUw1+fnxoQxeZXMHP6W8grfc4CsM6cqSyqFAEsaV6vfXPCuFq
         PVbAisOGx9fgFlh+9dMvF/gb5h47tylZY06AKMB6tIiRUhwIYXpuP6Fb7K6NB0dGpQ6s
         jLX0GAGvF/nEmYT5KBnHP2DDQkESdvdNLfS82k+J0zvGqwp6YcfjMBsXzpxXnltHPbvJ
         omPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498957; x=1796103757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
        b=SFDS60pGJIdLeNLIPee483Ms0eaQA+5KX6kdZSwJ8lxFcrro6gNIIYq3QOhI+La44V
         XO5hUfIl+aY38gcinUi8SKpMM5vcJpzzVfdaYbU4lAOipIgGId9NHfYqkP0ZUW8CnuS/
         GF/V44iyZRczKw/YQkiNnDycspYJIgOd0aQWFdl9tMxCykzKXEWrlc20IfL1aocCK4FJ
         HVa05Gy4nrh2kuHBDuLicaFplyz79WG7HWpsRlnFqKAn6mQ+AFfnfkdoJXtEcwkg22qu
         P/hQCk/FytN8G9y+RFqG0Ftgo/+EvSSlPfP4f6rIvp9sOisrQz7UA02eSLgGDWt1s96v
         TcHw==
X-Forwarded-Encrypted: i=1; AL+hErGGTQx63MadsLEt9GDAwBKPlMpQSLTSGpTYAdfifP5lLBI5Niy5VDRAu1SRJnHD0daGzR0w7nZDE1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gTuywgcsoJD3Gc329XkS4Sw9tQH+Or6tEOcbSk7pInO0lWoDy
	gj6mfpJ2hv++cbNr4HTwptCVNVz95/GUhYm1Kr7WynqWYBVGsOXbOIxBfvNnvr/ntKcZ/Z1xSPP
	bOAEXgr+lYCr/an1gmn9vLOKwTQWwKRUcVhUknPWjX5K3x4EC+/zVqh91rcpViTU=
X-Gm-Gg: AZFdTZdYQRBwebKf5kGynBWnEVACka3T8YRk6mTabVhlDdNuJY31wa7ZW56cOFmtl06
	EWSd8MReAzQkIOnPXBxTulnC5uwWxCZDWc7NkhBT2+VacqRlIxE3kgH8CKyCIuk/U4OxAhpJfbe
	mjXmZL+IHTjvNk4WoysW8Mf9gn4JoWPWvd+I1kUB7ny447rk2K54gUhVhrRDdjqH6PoufaoeWPm
	GftkRc1d3yJNxk4mCBnunXJhCWTwHQhswoOp+Xl3nW6NIzpLxdrm6eEI8Etn5LVyVtqg6CXOG0g
	EP/thkuP56atHn7+QoGSi/5kNxk7v9ZP78BLzxLhj5HHASHBh/iQBnzqSWZB847664/irYpvKrK
	4WvPup7ZoLrLHHkaDQjsP4Rpkj+cleUXmHuHfT1/voLxQGVKsV8UxzmxOqsIWuHM=
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr2355594885a.68.1795498956979;
        Mon, 23 Nov 2026 21:42:36 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr2355591285a.68.1795498956318;
        Mon, 23 Nov 2026 21:42:36 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm559533395e9.13.2026.11.23.21.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:42:35 -0800 (PST)
Date: Tue, 24 Nov 2026 07:42:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
Message-ID: <qosdtqsrw5cffm26teeopakktx4u7cnhslj3ynth4dx7qvwhct@lcipa56bnnjy>
References: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
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
In-Reply-To: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0523cd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=BncK6HumZM039qfKETQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX1EQBnhWP5xBK
 hlp5nXlatlwafKDsL76ErL2TsP1E+MKAObRJXw0nVEHWgzUOh+YMhBZqEYTxmYJfRPPu4ZdyWtm
 ZzDZW3IrDucPE+ECDJ2ttt0ADBAL4JafBbdRch43Ru+AZW+HByP0klfdlp1hM5u1Lqo8eSRvivT
 RXFofOgpIdHVAw7zUL4XUiOznNd9AWWWgpvlRGCpz/P2l6V5AiTIbMOXA1PPIyHjECzDP5ZsK1r
 GFBuAp+Lsa+XGeTnDfQ12A1BC1lj+ayJ3TY3Ds8+x7AXvsfqyU9Yg2PgbTro66bW//+NMNwGJqv
 hOslwAvUOXtUWwHe1H/gJj5vlhJM4VazG8EC0QH6utaikSFthGue42TsSNT4NXBMGFz5LukO5eO
 H0neb3pUoQndPOtrMONfTJetC/kzqkdM1shsiDc6zbGE6NgQMGUaLaXAkp7l5lNVN2QkoHzs4gP
 6lXjs8/dlwHn1IdgDiw==
X-Proofpoint-GUID: F5uQda33FjGgjjOoBrUin0rXTbtIDb5o
X-Proofpoint-ORIG-GUID: F5uQda33FjGgjjOoBrUin0rXTbtIDb5o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX1D7d7oi3LLh1
 /cAC5stvyCiEDqzKU6uu5As1OHuy8DhXgf8h3Va6Jwt0NpCPkL9g3iKxf7Rw8mcZmm3OE1pRe5l
 cqVa2XOPvpPW+Ytva6PxLHDyErDgq24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 21:48:29, Tobias Heider wrote:
> Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
> kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
> until the msm display driver loads, to help with boot debugging and to
> ensure display output when the msm module is not in the initramfs.
> 
> Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
> to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
> after binding the glymur-dispcc driver, following the
> precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
> disp_cc_mdss_mdp_clk_src from getting parked") and
> commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
> at registration time")'
> 
> Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
> gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
> on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
> dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
