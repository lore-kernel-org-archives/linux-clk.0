Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158180;
	b=BWwRpECWe+4vmIolqnY5R16BewBYbDrYWP1kqBxyziUyRezOS1Kw7joSC3WIGW3GbLfA
	 sr0f6D8UWQyrUiEVHwpxbT26O4PY03Itw/2DGdb16+S8q0wVPOPoZa9LfCcfKEwB5vYNg
	 7yeUIVQPAAb06mbRwqvVDbfPvqGIshZupkxw+TdkvTWWSsSeAq2Beh5CE3XyU899GNBid
	 1bIucOUVwm0e+zxF5iQu2PzvZLNx2fhBqNtn0BvrkoonScDK+FXB+hCueHVEQIlJLG7DQ
	 n8q6ngkVngAi5cAtuCLwpcTF8wkL16BuDuNyk4NnWbF5DIJT3EFUdwTCv7ck5XxUIDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158180;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vEj7FK67g3rIaaz5Lq/NNY45PcOS57ENcFCjo3BtHwA=;
	b=4PU6XQ7kbs1sKe4a9kDftX149iiLnhgk9+oktAjq28SDurPj564pSKhnF0yaRMlieQpF
	 0Xya8pzBMhz+bI3NjfAU2TBzf0JVMkzYNocghkf7kX0qo/Jr41bWKvsswrlsyVwv1qEte
	 0SpKj3CBcHB0IgIzJj6AXGArS7aUqYNqlJGBwvHQaODb9ut8gYcq6nE/EcB5F1Zh0F0dI
	 aMqi+hHds5yT9lllVADDPRJvkYxyI8bZgcT73pEOwwsoGv9bA571QRY/u3JLNTuxb02cw
	 EgBQqSm2txhE1/f8VMTY1Z0ZdsedFeH8au14okRglVGpjameCuzSiK6LPUkXQgRi5VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6BjhZcd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386C606A31A;
	Wed, 28 Oct 2026 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6BjhZcd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948061F01825;
	Wed, 28 Oct 2026 03:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793158180;
	bh=vEj7FK67g3rIaaz5Lq/NNY45PcOS57ENcFCjo3BtHwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6BjhZcdkiF7NzVN/VdODtDgSYU2T3vnRqqnNrciDnvB4d7eKRegdXZ2loH+5vPv+
	 Czm1V91BEUUCCmC7iAvk92u2RC2Ba+IQNpCkPBHAxYEH9pERkkrZbW/LJtdynShcHV
	 2UFg33kCflug53Ch2Rr7Y7iQIJH4DUZLk+QEuKOGaK0+73a66xuakEAO+9rtB8bgGk
	 SRQA3101JBL9pJEd0MwT4sWO6h2cp69nn+ycpVBWv9xlY/vs8z93mlar3Nfi0C6u0Z
	 ielLuh7Edi9767f2xt5OnZxaLLB0fqCVUsIk2WRMl3NB1vQRa7CSiNgwtkExD9jsfz
	 edQKopALHlMNw==
Date: Wed, 28 Oct 2026 04:29:31 +0100
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <76mvypefoe6l5c26xdycrxcyrtkpxmnybi6bm5xyudqqcbawg6@5dzvmwkhqk2e>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
 <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>

On Tue, Oct 20, 2026 at 03:41:54PM +0300, Abel Vesa wrote:
> On 26-10-14 14:09:04, Loic Poulain wrote:
> > On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > >
> > > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > > >
> > > >
> > > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > > gets stuck off when powering back on, preventing the system from resuming.
> > > > >
> > > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > > state across suspend and allow the system to resume.
> > > > >
> > > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > >
> > > >
> > > >
> > > > Hi Abel,
> > > >
> > > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > > collapses.
> > > >
> > > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > > >
> > > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > > >
> > > > Can you please try if above changes are helping on Eliza also?
> > >
> > > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> > >
> > > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> > 
> > So should the retention configuration above be conditional on
> > CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> > CONFIG_HOTPLUG_PCI_PCIE?
> 
> None. I think QCOM_PCIE should select it.

Nope. It should be selected by defconfig [1].

Just to clarify on how the hotplug support is fixing this issue. Once we enable
the hotplug driver, the Root Port will be allowed to enter D3Hot during suspend,
which is a pre-requisite for powering off the PCIe devices and the controller.
So once all the conditions are satisfied, the controller and devices will be
powered off. So even if the PCIe GDSC gets powered off at the end of suspend, it
won't affect PCIe devices as they already lost their power. So we don't need
GDSC retention.

But that being said, if any of the PCIe devices support wakeup like WOL from
D3Hot, then we do not power off the controller and devices. In that case, GDSC
retention would be required to keep the controller/device state intact. You can
reproduce this issue by enabling wakeup for the PCIe device from sysfs and
attempt suspend.

So to cleanly fix this issue, we need the PCIe controller driver to signal
retention state to the GDSC driver or the GDSC driver has to figure this on its
own and configure retention accordingly.

- Mani

[1]  https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்
