Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112D4CC29C
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979760; cv=pass; b=VMvk0karqsH/EPpk28aNbKZ5AIna9cRTAPnjkLj3gH3v8EQuWBJODljuUED1jdUJyAC6MDBkMlXUmkhK/a25+3WEMBF8vtksdFDgsbNKcyxDpuGL2tVDr2l44fKMaCLSAQPzYZLnisfSPpsEwOeKF1qzUgHbPrfmAWsQCUWz3dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979760; c=relaxed/simple;
	bh=0Km2hjglTI0X+tZl807cztADcm592MfLOkQaEkTFmD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzpYskb1sYXqbo/KstCn/EK+2AXRbk2i0sCfaOn3wN+v2423quThnpbMgw8O02jcxXSJTgZ2ax8ZWtvwFeCOTRwF3xHT7rQj5ng66+2OhmfyF0PBMxg7kbPnk2bJxBsjDURIe2Hgc3jHOGFpa1HniZmBcKvXy63bv2ozIDapk6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMkbZ6H1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpjrTrgd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMkbZ6H1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpjrTrgd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARDoN466360
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 12:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=; b=XMkbZ6H1z4YcaZ3n
	0fFqJ4bSir+zWDrdxCEGdlOSVxwC5hr18CbuaVvWaeFJO8zdhEm4Q3oCO8LZXFqt
	CQSQbRkUIeb5oiovZEHMOhD6oE3eZJG7kUMPsbicQnsVTO7byqvOP6vxdexdodMj
	FDOjTb+WJeo8RSe9VUs1f/4VFYvAl5Ihi/+dawaEUTx9laEIB1MSie2EWKmKlyI2
	3jC551CxHVQgZn4xdsNV5iUsBv4WCxjL6GJHIDo9lM7+YeAQo8raKzIQJ4Jku7E3
	TCIwzeJrcl7L7qVQRwAHoZwVTSNEvfKES2UxqA8YUcMdQ0BpKeLM7vts+uS1/Iyx
	voEagw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crbe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 12:09:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b937ecbb4so47413886d6.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 05:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791979758; cv=none;
        d=google.com; s=arc-20260327;
        b=SgEAtyLBv/bf69/jqqwzJUM0QmVLJqcM7C1ZTDG0NC6YRgu+UAaH6fGzk3zepQIoYK
         Irm7uZY2kqwxFKBUm5Qj8FNyu1ZwrwLXqqgx+REWml1asu9aYYTNio9PXC0jyUMQ8JqL
         32IL6smjEpPdOtAWpmoHPUulBfmV3xsVsusLDvGw+LCU54lhWY/0A41hz1pnE8ZMHdeo
         OrJC2gzlqjhHTK3q1ADUXi6EBk940KTiKhScxbiYS0piZy2LruhKvxm21p4o4dYACynk
         mUu+BzFRbj95kjrihoTEzMpTY/5Gv8G5mh8flFNFkb6wPpgclrU1CdnWyJRhjhzQ7A5I
         zNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        fh=b2WbKSRQjbQ+OMakdkwxuAi03xsDpqzhPLi1DOKA6MQ=;
        b=kyMiKSsJKKCuYmBKvwkOV7v6+hNzoWj8Fgmc0TdQSp0TtvC06qoEoYbfb17BrPY5LB
         DvI2Ed67K+I61SeJznwZR1owzGdCyfu4/n64db1WnNH/sSoW/8NSyYGWRYkD225OvIlC
         5UzVquMf8/yltFmpDRC319H2ElkhTQpKVXiD+TAzX+JQ3ezTbO/AVk2xNirf8tg8W70f
         WDYYsaDafgTq3GKwcemjE9avLC0HGrEKW4lg8WnjE3kvQe42+7UrpCi9MS0Q1CxvK9Jw
         zxMgqCrH5qPiXNP/3H6lJ4HlCjtLk71rQYI93MbN0v7gUnifL+sQCRSYVFHaDCyo8Mr9
         hsMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979758; x=1792584558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        b=cpjrTrgdC06aUtGULIO1L9ATg9j3WyZlni/+7EYjH2XjoSsXgEIdm0Xu8CRDu1Umkb
         FacPh2eQ+u32Wy2Vq+UUzM5IjvSkQEvsyHUO9EK8QesO8u6kPJORhJ3Ro2XIhK4gtpp7
         v2/xG41DN5NoWw9Nu5CT6q4VN6tN6ZWLldeUJv6PyZxXFty+3XLrnh3UdXmXKllXxjKo
         VYeFHns8q0QEGup+dZ9biHHnr0V1RuszSuTZXNjuesXSWyXuQ613cr8XIfjNPFQRWW/S
         FDxc0dsF09X5zdm4b8ndp5jTVj9SL5u+DB70HQ98URC67RNHgfhwxtI/rgKe65IuGbsm
         Fr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979758; x=1792584558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        b=ZizflsCSDPau07FAji5SUysUyUJBU+HVJ7CifrHF4r5olYP8SwSqUN9nUgSOPhoh6s
         DBJvyVQZBaeOYmmBz0XYa8uP2F2BxU9x0ARi+SfxOtQPj4hVunv+EpP3rxoSFUwz5Eem
         owwL9VesrXV7bmjxNYWDwQCaAVtiX/2al8F4Vj3E0FDxjURLqQ+nBkQTFhpvoyqmLzYf
         I6Nw1kA7hfvY0p3juTIJOw/8oiMJDLDJw1uQiF5XNn+T3Rx1bFDln8GXP74ydYg4nlY7
         i9s2ddM5aj012ZVYUtnwzDO99C91Qm1dTg+BHMUlTwMyyHtZrztgsiYCUDi2sXlx72o4
         M9rg==
X-Forwarded-Encrypted: i=1; AKwUvBymEEIpGmMMWpYDkgRsRG/TEh+YFHquVyz8jGpBNXdl8iVA9nUZ32+y0DACAtMAlG8d3+MDStFTci8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL93yNjKrsqsjIu+a0Bkt3uL2qRIqwXFGc5qBOZdfyuLOzgtClW
	hW6o3P1wKkRgUpDL5Wo6vPd/AgiehzJHWJdCXJg4M2ukBgM9kFwpSjjNT4QXMSTaLpq3DcTLTGD
	4wl1IQcMGwnQxPJ9ei1tvK7e0U+rU3wRWFFu4yxa/CGY4JXZNh2ksGonxUUzXx3A4tl1LyQoObv
	Nf1Kfeo56V/FV1xpseXWh0wcU0HznRrbk2EfbvHQ==
X-Gm-Gg: AYBFou1tHSv+uZmGVB6c+Ny1ba52xro+eNmlDFeTofv5xO+F5f8dFzQMB2NG93YJSWh
	yFvbC7yR+p3Pr9KD9BcTv+kS8jZ6H8N8VR4GU59sQBrVm945smcKGImnT2f5daLtGiwma0YAQqM
	lIxmQ4MASPSuAYcNfb1REs8M8TnhgKYK1YNj8+uwC9ge/hUWb83Yvr4WFufyvsJkOljq8LsOtFV
	FNmedu9hw4Tv8jyGX4e6MAUrLAf/Qtu26D73LQwn4wVHemRUFZMm1XGRQpcRNoo9FTh5JXJJLb5
	ys6x5DF1luvy+TdKqcKI7/AgN0jY
X-Received: by 2002:a05:620a:171e:b0:93e:5247:f61e with SMTP id af79cd13be357-93ebd228a3bmr2658574085a.25.1791979757774;
        Wed, 14 Oct 2026 05:09:17 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93e:5247:f61e with SMTP id
 af79cd13be357-93ebd228a3bmr2658565085a.25.1791979757031; Wed, 14 Oct 2026
 05:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com> <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
In-Reply-To: <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:09:04 +0200
X-Gm-Features: AclHuK_6me2-bpjZvRwlul00xDJ8S_mO1DUnyfvzcWigNvRin-2Uq0Wz7yOgmmc
Message-ID: <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX3gukVZUypWKD
 7sVIv3I+lLs8mI9XDa5R7Ut8JLdca8yu/0ZlH9S/0TBawnlEP0JyZUd0UUMDqQH1qeK/Q5NMVUZ
 I/ZdKflutNUSq3HzNr37IKshmm0lDx4=
X-Proofpoint-GUID: P6cMBgeqycDycwpBRnHD0HzeoiXfRZFw
X-Proofpoint-ORIG-GUID: P6cMBgeqycDycwpBRnHD0HzeoiXfRZFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX7ivKTCD1/GcO
 CzlsGPnmAIhTnRVu1LHdAE1py83c1F4erRlsvyU2U8bSIDWiYdMJN8ujEiY3huqHUVMU3aFGNXh
 QzO+fPtC4M6UVYmVKf0RBJjYEpAIl7UvNEeLQCJrFpek4wSuFEkcEe4NAoBMV4osk8FM77nCUFe
 bGdRrEsZN/NpTkpMko0eu4CMSBsQmWzTZ0UqjBtizuPDD+WON2BlenHn6FK0Y/Lqd15agNtzGvx
 vmKYtLYW18IRgKwiCvYnlxs5zeAmAgoxYu3V7xjzQmxSUAAJmSy219RzSnYnIf/rDnMcSeTiLd6
 +bmTg2TsothFUAGzoE0fX9fbfYKNXsphyICzJS/yWn8AYVdw/pKdMz+jKbZvVD07+LR47CAtG6h
 D8EEG9/7ad4mDrBNa40cEQPF2A7ix2Kb9DG3njk+iC+gqrogaKOl1ZhZCZ+6sDzh3mdNMkVp8G+
 9sl4/TG21l1i0IWqfkw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf70ee cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dbYQlMB5Br7l-mLdANsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140048

On Wed, Oct 14, 2026 at 1:59=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> >
> >
> > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > gets stuck off when powering back on, preventing the system from resu=
ming.
> > >
> > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve thei=
r
> > > state across suspend and allow the system to resume.
> > >
> > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock control=
ler on Eliza")
> > > Assisted-by: LLM
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> >
> >
> > Hi Abel,
> >
> > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and th=
e GDSC never
> > collapses.
> >
> > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering b=
ack on), picking
> > the below changes from PCIE side helped to power ON the GDSC properly w=
ithout any issue.
> >
> > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.=
qualcomm.com/
> > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasiv=
am@oss.qualcomm.com/
> >
> > Can you please try if above changes are helping on Eliza also?
>
> Thanks for the hint. Mani's patch (v2) is already upstream, so just enabl=
ing
> CONFIG_HOTPLUG_PCI_PCIE did the trick.
>
> Suspend/resume works fine now on Eliza, so this patch can be ignored then=
.

So should the retention configuration above be conditional on
CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
CONFIG_HOTPLUG_PCI_PCIE?

Regards,
Loic
