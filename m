Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703437B032
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819856; cv=pass; b=crieZyAVL2axwHVM8lpvBQP8xeNHaZG/0S31LXcbw59LuqVbGJINHSUrFaAtiMXKhwp2vu8M/qSoc4CHYfwCn/KIKyYxHsCYiPRXGpQsjr8a79JqVKAG7WIGvjbLz/NTTeN2AuWDGfHKplndCZ5gJtOWDA62jPzf7AHVAKANNw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819856; c=relaxed/simple;
	bh=/c9zl+54hwUOmTa4dg8v1MVpQXr+ZCCukq0n4KeatN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbDDNu6GCuCIPhYJ+6To7hefRsCUzJ+pWvbiW1L2nJsar+WxTbyBYHjpu8mU9YfbwTSN+9gh8+DK/O0F+eXyx82/sISiuhuGI6dGOIbECuJfvmeCjcRlV1DMAjO93PhU+jOtlv/tczycR+FfuzyydNniBOsdMH5n23bYf/XNFQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwMzNU2P; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwMzNU2P"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so9592237a12.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 18:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790819853; cv=none;
        d=google.com; s=arc-20260327;
        b=YZtcAEzwBNqzsbU77mp/jFjphWj9/lQNdqNTZccyZbs6joArLeacU+cXgQYR5bXY3R
         aZzcY3TJIsjasR8YgFmwn1qied1dbFcF9W1IX65G/4spS2M6rJZGxMSWGpBvZRro6nPb
         xRWjk7STxgVq1QIaqXusWMHfn5nFmmBsuziEBiqGFFH79iEcMzJ/s0oaOMuYX4fcsfyC
         MohvubUR0mAbVbwd7pQnV7xUdHjOBg+vBdF3fqNH+gGCuqZCQPLCPWlwTcOxitC/DhRN
         wVyU4HTCM0KGrj34xBxtoSLCxLpvYf+Y3cLCkUJvP6WQ+x0EpbhnOak7hU2NpZKiyreR
         9lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        fh=dsrPdU5O2c3eMvcAuXKUQQIoysayo4THX84Bzst5ozY=;
        b=e0W+GUEVmWySj6OQ6psfywdFAu45b06UjR/7Go8lXLgn83r3yYZQzBqgJFeC5MUXsw
         DRKSucwCJdPV16+2IwBhbO15HrbaWf2a6qXWz1R0x6y8tzT+3RhrWN9gGLI5xMSBqNuM
         vuRchOAJ8lTee9+2L7mVAYn0E+OfqH5vFdcpi+Ysao7kxzygVuuj7ji8TteyN3TUInEg
         WjcVsTBuy1GtSMJy82JmuFUqMf0OaGd829ROoSzAwYnYKXmmhdZgg4myNGYoQAUpKhOz
         MD/N/rheod4hHF+PIcW7EXW95Kgvbj1VeMSEj3JAosh3293d3auPFCt1qxCcQF2JpICb
         m0eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790819853; x=1791424653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        b=OwMzNU2PUuE41m/LtP5fOvQEsp6n9pNYXLzkpaWZM3PkQXD49ZEGKtGt4rSrHoUkig
         nhUSw7WlkAku3L6g92YlUsPaIteKxmFQw1I1b0SsAccBDvaUj9E5lTE+AtxhSaUAAG0B
         9OWER9KUnGvHWlMbgIqjU0Vo1ly2hz/TFaSJ4buI8PDoSAf9J5mSRsXEfNZl2RN/u49J
         GRR3MHyj0SUr7FMnO7zQuZjGU2t55HAEeNVRQ/gUp/Q3RqEHhHjxdNNOt8dbnDuE8bHF
         /q5ajZp9W0FJKhWbUjYzBUaHtBeEaadZL/VIlVxK0y/jkNkTGkDNdK4YhL3KehI8nQBo
         M4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819853; x=1791424653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        b=0gQcAs8rGSwsr+YhwZt81Ve7TeNPcXZZY8hPG3eMVWmNSQFZMR8cWX8lZusUZOBp84
         2VpjC3MzSB1iqZnekl+49oenF6SL1ts9tUrUfFzO5huhilbENut4EwMLk5wAc1EI0+Jc
         0LMvgaaQjpMz+ZAvElvzZkmauJwY1FdiWNJA7PASWlYv0iOQZyg7G73vaNJKTAWpRmRb
         3Tv3qK47JGu79tiiBk5Px7S6MBHdElBx+0M/8MGh6D04rzKn2iVrusFmTKNIbjDgPVer
         dIfYq/mAiFaRTZayM6my0NGh/aQ6vf/+6U0DpF/cFGSgdvZ9HB/bJJXasEu1ZUmJJV4K
         hALw==
X-Forwarded-Encrypted: i=1; AKwUvBzM1tE8Mjp3t+mWq8jj5xAJq/UMKj/bfpfpfwxwH76Gubu2iGAsKsZruRR55IbxL5xQhXPZlchRCZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH/ahOOUwb8a6lUehrhonngn6mUuo6KvwHAHnyB4cFUMpSfHtg
	FrlENao6//YnW2Jd6brqLdhVaa701zI0vJuEzkis8Bu9wqgjtwOlMFu18/OCamPfkDfvDcdBMyo
	1YC95nw1zkiMUgaACZ+8sDgh8R4brnDBeHhwn
X-Gm-Gg: AYBFou3RtUiyrtQ4C8XkNE1C+Ee/jRr026sDOMP+cubFE82hMPKLZ7ORBONPpAUC07z
	+RzbGG19jRZE29wZhsDY+h28YVl64ND2qfaDWIYdbc1GlLhujfq9s4PmDejJRv0xIzQ3zQ1nVrm
	0tfV0ZzK4F/FBmpmCnHbQRLDX8KTIrw1ijFcL4T+mzEDTas71kND4YuqvNgytzgIf2saI27CK+I
	E2d4DixyGJZ1gA7KnjGRkMdU/e5CSgubEgrtssMJ9wVWJ5qZrKMjzbD3tvLH9BJGxMpMmLc/Yai
	0VeCr7FTYdSHYqsao2mUIqo2kBOEO49yLG3aNpTK56idNXkyf3l7cn2V9E+BJHI/aVsAifbdTlI
	f/EyjtkNeqJxQx17Wq6KmgiZPlbtDQb3g9/0G8vivgtcNmOtLF+kqbEZt50SZTW/eyoxDmUMOh9
	Ku77/wQ3bZejPEPnOC94QRguufQA61gvlMtaF0rRP9cJirrItiNMunXZ1HaqomQsTDhqduti6LF
	emTp06AoWiswhuJ2LPVbg==
X-Received: by 2002:a05:6402:190d:b0:6aa:b357:5e80 with SMTP id
 4fb4d7f45d1cf-6ae1985c8abmr2311568a12.1.1790819852698; Wed, 30 Sep 2026
 18:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202610010151.2W0MrmxE-lkp@intel.com> <ar2eD2s6pDLd73DR@redhat.com>
In-Reply-To: <ar2eD2s6pDLd73DR@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 30 Sep 2026 18:57:20 -0700
X-Gm-Features: AclHuK9mUOytzfDF8T7V1Y8eAyEnjeGtJ-OTaJDbudHGy_i-egQOpkQj2g3zCbI
Message-ID: <CAKxU2N9ooKG_Wj42iguY6RsHat-=vFGWTwOjmi85CG1yjBi_ww@mail.gmail.com>
Subject: Re: [linux-next:master 11187/12559] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
To: Brian Masney <bmasney@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:41=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Rosen,
>
> On Thu, Oct 01, 2026 at 01:18:36AM +0200, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
> > commit: d0b72c88671b3c46342bbebc9b90280890436c98 [11187/12559] clk: mmp=
: allow COMPILE_TEST builds
> > config: m68k-randconfig-r2308-20260930 (https://download.01.org/0day-ci=
/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 8.5.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20261001/202610010151.2W0MrmxE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/uapi/linux/posix_types.h:5,
> >                     from include/uapi/linux/types.h:14,
> >                     from include/linux/types.h:5,
> >                     from include/linux/of.h:14,
> >                     from include/linux/clk-provider.h:10,
> >                     from drivers/clk/mmp/clk-audio.c:8:
> >    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_suspend':
> > >> include/linux/stddef.h:8:14: error: called object is not a function =
or function pointer
> >     #define NULL ((void *)0)
> >                  ^
> >    include/linux/pm_clock.h:77:24: note: in expansion of macro 'NULL'
> >     #define pm_clk_suspend NULL
> >                            ^~~~
> >    drivers/clk/mmp/clk-audio.c:405:2: note: in expansion of macro 'pm_c=
lk_suspend'
> >      pm_clk_suspend(dev);
> >      ^~~~~~~~~~~~~~
> >    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_resume':
> > >> include/linux/stddef.h:8:14: error: called object is not a function =
or function pointer
> >     #define NULL ((void *)0)
> >                  ^
> >    include/linux/pm_clock.h:78:23: note: in expansion of macro 'NULL'
> >     #define pm_clk_resume NULL
> >                           ^~~~
> >    drivers/clk/mmp/clk-audio.c:414:2: note: in expansion of macro 'pm_c=
lk_resume'
> >      pm_clk_resume(dev);
> >      ^~~~~~~~~~~~~
>
> This isn't directly a bug with your patch, however it is newly
> introduced now that the driver can be compiled with COMPILE_TEST. Would
> you have time to fix this up as well?
Yeah.
>
> Brian
>
