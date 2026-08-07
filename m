Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E926CE05
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786125063; cv=pass; b=CTvBKjWDg7aG8rvvuMNt1I6r2OYUC0/0TTLPEjeO1URxnOeKG24ZdZZarQOVg3mlql8kE4+5iTCNcxCL8DBBPUCaNfa8adXKYaf7IdaazFUOKUWeJ9CLyL5K7o2MWqGjgFaCiJn64L1O6iOfFFsqj2mcVcuxrCH3BNwNVcJVLnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786125063; c=relaxed/simple;
	bh=Y5Eon8RQ+CcJu2x/PUMS0016ahTcxgHY4XXYlHwteqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUxVkEbcwLcYeaWritXvkBTVDGXVORh/C1iamohxEB1fb65aMbsKc5CA7UkUIrOvK2h0R+ZbonN6FMBFBU2ge0YzYcBLf+OCt4tMSKUDL+he6eWbFbPMwaNIR/L0NiruZFv1wpccx5SZ85me+D19Fu9aadYmi58cuGQo2iEDQPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzSUqHmK; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzSUqHmK"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ae542c486eso1582491eaf.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 10:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786125061; cv=none;
        d=google.com; s=arc-20260327;
        b=DtWrvJDcWL8AO59h7JGZBG3UXZDwAZ2NcGu39UsWF80tjFPhYyJiuaNiRPdianU9+p
         uXYZ8pSCciWVYBI1fyzvtO6any6CcDRhI26WpVgpZHJevYMooZQpfXVsq7OmzzKx1JkY
         ambwjACqMMWYbWS0If2cL1TpD0TlQpWMMZsclOy5iURDO1qOqtyuz1rliaHMwgmJ/MaQ
         V8M+8qi020zPQuEz9R2OHsGXgtym1tmy1DpJD0Fz7cXrh8ItGQueBDZMpgo3bpg8V4Qm
         HVOXVtcQALwmiFnAUwshQaJnWl+RkrMzXJDfZNnAXa39HbTClPaOmp/Q29i1BIFcx707
         oyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        fh=/aY7QSUpf01gvWCRNMia0dfoyDuQrcvH3ktrDnulOsw=;
        b=WQSF6pv2kTWICUtmtBoTKB0n055ATkBSIIlCY4M+pUVPQLTHfO4QDE0OIxLPH6qCPn
         l73hdhrqS96wwF8sNZjpkcpibM8gitnNCYZGidlffsb4tg7hO9i2eM2BLYVtTsDMiux4
         uS7EyITjxI/yv9HllB/G+8jh79UXO5fwUhnDjQuXaEMmQkatBBkrF3TbfkH8WYXVJ8Ok
         tKHETD4dBP+/xOY+B3xYfE0+jsvrzbB/tOl68N0aUrWKpMLxvgLizR+x+rXUHrYDIX7O
         yH4hoLTbiLXUh91xE9hky+gx+Fs0mPlbQKHNDe5Byj8LHPmsc3WGwJnUhRwBgbbrpRI5
         eDxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125061; x=1786729861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=ZzSUqHmKQ6sEQsyN9xlL1nxZho267zJrmmdM5+PGGpOCYwfR3Zgt58Gxnc8bh7S2Nr
         sxDzDg2SaFGQ5rRSiF7iac8em6MH4hGbbTcXjL8AoRDv8Qrj23eWXSZcrKHFxK9v9LDk
         HG82IiPn+Nl0Tala1Iy2Oz8pfRlGhgfpbbqKh3rz3chEeBYdBL0tYqV83tWKmz6WVgNo
         CZnVDPD13T5Z9AYbOk29yhek6dLq0xPj4/ygHqzNXCPODZhckk7osvcaIv1qttM50POs
         xwJ28mBS79XA7CZ3sSk5FqIF8GhkaEYkAEr2zx3b2LIvEpI84qvZ7P4P4Z3QN8ony1KH
         Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125061; x=1786729861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=K/BisSC2umZf+2GhU35JYnbh+XgAVuiKHsHGi/EkAwEIxM9QhA0qfHJi1RoyDEigsK
         Hldo75fxsyAGrAWWmODw1DYSmEd0Yh8mFhgtlfMytMyn+CK5wfyPvu5t0EaEkcKE2oep
         rppWqEBZPT6pzX5Xo3JBDk2V6XuOvHXlUBVWYF554jpIzsO6TOP+e6itmEiw5UF+2bwP
         31YbJkqYQT1C3vPg087sX1VzJkjnZpEQ+S2kXo0zDSX8xQgEDwtTP8c4UA95D8vN6PKT
         fJCBEyqSBcSOqwdVXM7wShdmsE0sbVfCQ3IrOtzfwMTaWzQpV78ysHPWLFXpzt+4Sa1l
         w72g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6hPh4K2Bii376QK0EecnQKpIdbHLpmQ3CwoTbyegQS1kSTuhpkgHlBn8OGIQIm/4TdpEcQqU1h7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOVx8fmGwGXtnJFi1QGsuhEBPVlsOoswkDFbBrkxFul6juiEm
	qWuytjs6z8Y2VMLHao5F30ph7a/GroyRjmy5YMvMKGM1i7YW4a50GFxZMYFgFRea9DKRk4xtvg5
	KIrDHvBMRD+GtsLIwxT5GKRo1qZuox7I=
X-Gm-Gg: AR+sD12s0vR2Q2exayrVUIT+l424Z4VR00i0suVPXn3/3X8QhVq36MLcguu49IlA2t5
	pqx7cdEPE1KiAcwPZ5BBKWlvkoqkhdr348nuNuI4otH87GyskYKFLhmRSrvRGs+FACUKhxMVTaU
	zQkq8zOEMXErBIy142O7ah9NEhCP7rUkoN957eRGk2HOYVC7X/AR4LJFMUCfN4u6IBpRjrkFtHe
	W043qRDEa9J6osgsHM2wJjH+vf+0MGhFVM6KKQMwMYCFkKkXGDa072lpcLAymtBHH+0q+T6nai5
	JzeRGXWN7NVv1QLpcCBFKjne5cUGVbJsenm97zOLPMDHBjwPGrp+bWLc+5au8FsSZ2Kq3AQRX/Z
	6Hg==
X-Received: by 2002:a05:6820:811:b0:6b0:40d9:8ac6 with SMTP id
 006d021491bc7-6b041f594b5mr991109eaf.9.1786125060721; Fri, 07 Aug 2026
 10:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
In-Reply-To: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 8 Aug 2026 02:50:47 +0900
X-Gm-Features: AUfX_mw5H1veunrAd0DWILURr17Bo7nhldWDJMLG41xotTB7eMODtkVZIaJFjgA
Message-ID: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org
Cc: Brian Masney <bmasney@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

A follow-up on the GX6250 issue.

I ran the diagnostic test I mentioned in my previous reply, and I now
have a reproducible system hang along with HWRT/free-list lifetime
traces.

I built a diagnostic kernel with temporary tracing around the PowerVR
HWRT and free-list lifetime paths, and ran:

PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm

The test was run from multi-user.target with no display manager running.

This time glmark2 progressed past the point where it had previously
failed, but later the entire system became unresponsive during the
desktop/blur part of the benchmark.

At that point:

- SSH stopped responding
- local keyboard and VT switching stopped responding
- the system required a hard power cycle

The HWRT teardown trace immediately before the hang was interesting.

Normal HWRT destruction repeatedly looked like this:

dataset-release
-> HWRTDATA cleanup data=3D1, err=3D0
-> HWRTDATA cleanup data=3D0, err=3D0
-> free-list release slot=3D0
-> free-list release slot=3D1

For the last HWRT visible before the machine stopped responding, the
trace ended at:

pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...

There was no further PowerVR trace before the system hung.

Therefore, I do not think I can conclude that the free-list reference
counting itself is the root cause.

What I can say from this instrumentation is that both HWRTDATA cleanup
calls returned successfully, and the trace stopped before
hwrt_fini_kernel_structure() reached its first free-list release
message.

The tracing is intentionally verbose and may affect timing, so I do
not want to over-interpret the exact failure point.

I have the diagnostic patch, the full kernel log, the HWRT/free-list
lifetime trace, and the glmark2 output available.

Would it be useful for me to send these to the Imagination/DRM mailing
lists now, or is there a particular person or list you would prefer me
to report this to?

If there are specific additional tracepoints you would like around
hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
can build another diagnostic kernel and reproduce the issue again.

Thanks again for taking a look.

Best regards,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@kern=
el.org>:
>
> On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Hi Angelo and Chen-Yu,
> >
> > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >
> > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@r=
edhat.com> wrote:
> > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > Hi everyone,
> > > > > > > >
> > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > >
> > > > > > > > This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > >
> > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > >
> > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > >     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > > > >       domain library, which also depends on PM
> > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > > - Adapted to changed DT bindings
> > > > > > > > - Dropped driver change
> > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > >
> > > > > > > >
> > > > > > > > This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > > > > some Chromebooks.
> > > > > > >
> > > > > > > I'm making a pull for Stephen for the clk changes. Should pat=
ches 1,2,4
> > > > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > > >
> > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > >
> > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants t=
o pick up
> > > > > > DT binding patches. Otherwise I can push patch 3 through drm-mi=
sc.
> > > > > >
> > > > >
> > > > > Not sure if I can really take the DRM bindings patch through soc.
> > > > >
> > > > > I will take the devicetree ones exactly right now, even though it=
's going to
> > > > > give warnings.
> > > >
> > > > Apologies for missing this, but the first DT patch depends on the c=
lk DT
> > > > bindings patch for the clk ID macros. This is causing build errors =
in
> > > > linux-next right now.
> > > >
> > > > Not sure how we can fix this right now.
> > > >
> > > > Brian, would it be possible for you to split out that patch into a
> > > > separate immutable branch for Angelo to merge?
> >
> > Yes, I can split things out and make an immutable branch this morning.
> > But it sounds too late for that.
> >
> > > >
> > > > Otherwise Angelo might need to drop the DT patches until the next c=
ycle.
> > >
> > > Yeah, that's so bad.
> > > I'd be happy to be able to resolve this, but it's too late on my side=
.
> > >
> > > I should've checked the DT patches more carefully, my bad: I got a bi=
t too excited
> > > to finally see this PowerVR stuff working on MT8173 and going upstrea=
m.
> > >
> > > Sadly, I have to drop the devicetree patches :-(
> >
> > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I =
send
> > Stephen an additional pull with just those patches? Do you think he'd
> > pull that?
>
> (replying from my @kernel.org address again because I don't feel like
>  pulling out my work laptop.)
>
> I think the question is whether the soc & dt maintainers would be bothere=
d
> by it or not.
>
> No need to sweat over it though. It's not like the GPU driver is producti=
on
> ready anyway. We can just merge the DT patches in the next cycle. :)
>
>
> ChenYu
