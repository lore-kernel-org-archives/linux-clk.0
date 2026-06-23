Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CB36D9F9
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209256; cv=pass; b=d5C3w0ETMlbjvOjugZcGYTIjn14fwu35EhbfyeVlUUkGURkSmhLfoH+1xvHuiFiASL8j+QHQ6CgS7IasX+99KRhUjypmu4+gpN2kuxFT0GCl1kaB86ChLlYiGZ1auMTkj62IqiLrgDI3jU3bEwZvoVFOJEg/1yePLnuRNTC017I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209256; c=relaxed/simple;
	bh=AA5ZTDQaBOWLcp0BROAdqNsd56PBTXdSmT8yAbvlLVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUgYxYRG3JddySqqa9Qa6rOMmk1ar+sOTIeMRX4HHyQUfzlNsmwMMeOM95lQ4LCuBR0cqsWeAuPzyhJkZT1pd6AzVd5Mn2ZNbtcsHCKNMYtidMJE77xo3LkiGfLdJzTvxFJ76RfAWg67pRw7dtP5/UNr2KmnBg2ClCyEwNm1HfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ry/4sexu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CIgTrLZp; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ry/4sexu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIgTrLZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782209253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA5ZTDQaBOWLcp0BROAdqNsd56PBTXdSmT8yAbvlLVc=;
	b=Ry/4sexueXZwp7U/jjFSYMhFEKMO6YI6xPCvqIXy9ShnI6HawJe1BpKVr6hHqbNw43E805
	6uNxgicjPg6nZ90bxIBD8dFkFwIlKF9lg7EE8KAZGyUu6dlmmykTCS+EchmPqIOzAv9ODf
	ipVq7TILysIuklX5mMWm4+Iocb/Nuj0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-BX9jNWSOMluhoo-JjyBhig-1; Tue, 23 Jun 2026 06:07:32 -0400
X-MC-Unique: BX9jNWSOMluhoo-JjyBhig-1
X-Mimecast-MFC-AGG-ID: BX9jNWSOMluhoo-JjyBhig_1782209251
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-bf481a6e4e6so588702766b.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 03:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782209251; cv=none;
        d=google.com; s=arc-20240605;
        b=bTRfHGIXKgYai536r55iCTlmHMj1MIEY+06usSjZHp0Z/selwGFzZ9/HZ4iYkD2K89
         Wg/8jcdZ7RqmZkDYYFnPMRna4tTo/qiAb7NQVOfwvfX16nMyqYw95KLK4gKkXn+vN68z
         CRTtZ/SWC1Mdk0kYhILa50R2IBd5S+nmBFyrwzdbF8OGNbjdX5cLzos6ei96Pps9egxj
         o6Xl9J+V6JakoPSWolTg6iEliBWdK2iSMCgJNcMeFCoMPiqrZTkBzFqyxVPv4+W3uHA3
         4q3ZA66Hlvny2cyynP1HVHSZZ4XszTqnHHL5O9uawPFyzniWStGqgUgrM76QcrbrVf4K
         mHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AA5ZTDQaBOWLcp0BROAdqNsd56PBTXdSmT8yAbvlLVc=;
        fh=YAsfBkMlfILBUdBmDanHEn1vchbXchphPr9gZdzL/js=;
        b=GUd1NATNg00hpJP14FSxehlqCuqdsSjJLQkrwabgWVqFpwuxJ1Gs3g8WWVXhWSxPmK
         kL7pKW7pV1xl0eBTtsMz+SsvSdSgXEv19bF+pcqVMOvaGeyh9p+QIhfNz+sc9Oquz6dz
         kYLZ5JaeGHynra1BL6uX28BqXTTxZzjYARpDTwJsmwH3CPqrL8i3dwZ4RtUpXa+XbRjc
         me0wxAgd5PJAFZgacNdS5LTJoACFIcfYc37iRdWulk1A8zODpKp5pkoGmUvFCIaI1j8+
         F/ky0XGbRvvlKYJndf3jo+eAtK4v7jO5ITmu3cjzjZWwwB6uSV7clzgd3syQvMpOLf6M
         G59Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782209251; x=1782814051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA5ZTDQaBOWLcp0BROAdqNsd56PBTXdSmT8yAbvlLVc=;
        b=CIgTrLZpsLkT7kJKHfHQDV5v2Ioyo1dFEjv+dS+5wQlUlqqDJz/3afL2psj5EVZw05
         Z33MP1170W1ld77W6GzzpT5LkjyyiDIbndmGQPxOYWMWOxoXUSrPhTtBaY28b1zGV+jq
         y+I+gGfFI9okpNLekrzEWE/4PsserzUOV5XFjyYTRcVSdlecHQs36AdFzahqcO/yehKu
         K8967xzdgvLEVO1DSoEWjA3jRYvVWrmObmBRnmK9gnigizGgZcJGNc3m4pYoZzkuGfby
         yEUmX/yyxpZycT43qPos2+mGgAHNrInzzrf4DW/SskTQMDbQDfmlsYf/hh+JkQQFsSsu
         Ui4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209251; x=1782814051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA5ZTDQaBOWLcp0BROAdqNsd56PBTXdSmT8yAbvlLVc=;
        b=F8E2lmQ2MZvMzluZtdtS9haXwHQg3it6DiE/zq3ub6snRvKvlzsDU5dyTRAiLCBbPr
         0dWnzQe9ym9akPb2XPu1FPO5dIRgnSmuhnGDlvVLdT6zt3zi9GUJET90cc91tXhJPhq0
         QIiIwbw1eYd3Rj3ZsMpR3LtcTbqpVaT33pKSeTjEQ35XcqEM39j1fyRrHQ79YOYqfIJ0
         1rDvP/0utXIJQH88eUO370Wt7A5sbtr7XAOjluu5BF9ixbZ2sYW+Tygwrg95o9R9PR6m
         Qea2dDz/FH5PW0LuCiYJ5008JPq/xmKIQ5AP7y8oVwkmP5aSGtkWxe0XFuNydF0cjOxm
         vm6w==
X-Forwarded-Encrypted: i=1; AFNElJ8Jnde/ctMqdJBgyyJw/ABSKFAZrecFdtksln7Nfdiw+4nIssRj+S1a4JunhgnZaZ2/SYjeQmX1bPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsoYoQK9ZZ9KWuHSfD9xXKtzFNxpmaQUeqdpTs7jc/USzJSHF
	QLRi4NqY+sjVbG3YNO1/ta0UNYnqBvkCjYAtbpcmyNe1JtVZcVxgShZwNl6YwgXE99NeEb2Meng
	6q5NMki0E9YsDLn9mbfbHgQLvOCVfzLI+QKR7TesLLsXYXjRU0tlh0VJJ7BTrjDirzAudckiGlN
	4/NV7LUPXIg8rQqQJcCVP4ZtQ4Gxmnm175e4Bo
X-Gm-Gg: AfdE7cm0Zl0qxk9eEAbv1j2gf4DDkycFSDO8RTOLu8fGl28JIHyFHSxP/q1yWPzAUQ/
	Src9oUMf4ogb5NBzSmfPbARZeLE7XYjJ1rn8OmGhefovGOfY6/+uxKMxeO96A/LKR7zW7pPtFUD
	OQpUAiwu06KIQFnuoNZcJITFIbIAOc7+VOT8kZnk/+bB9o9e2yyGrLjKBx8hROYCe83eo=
X-Received: by 2002:a17:907:1ca4:b0:c0e:f2ba:f9f6 with SMTP id a640c23a62f3a-c108ecf75f2mr98654066b.40.1782209251005;
        Tue, 23 Jun 2026 03:07:31 -0700 (PDT)
X-Received: by 2002:a17:907:1ca4:b0:c0e:f2ba:f9f6 with SMTP id
 a640c23a62f3a-c108ecf75f2mr98650366b.40.1782209250375; Tue, 23 Jun 2026
 03:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605092118.1945-1-dongxuyang@eswincomputing.com>
 <ajAnepoevsCEHdqg@redhat.com> <15b38ccf.7988.19ef3463cc9.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <15b38ccf.7988.19ef3463cc9.Coremail.dongxuyang@eswincomputing.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Jun 2026 06:07:18 -0400
X-Gm-Features: AVVi8CcRJQSAcNsQsk_QV0EBVDYe5CHtsRpOBmm8bvhGmgFT2H3Kcb1Ne2cfizg
Message-ID: <CABx5tqJ8irsEpAU+d9N97pc37m+XPTisrp4Mpdf3yaGRQEY9Kg@mail.gmail.com>
Subject: Re: Re: [PATCH] clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, huangyifeng@eswincomputing.com, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 2:58=E2=80=AFAM Xuyang Dong
<dongxuyang@eswincomputing.com> wrote:
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> >
> > FYI, I posted a series to implement sync_state support for the clk
> > subsystem, which should fix these type of issues for the long term. If
> > you happen to have time, I would appreciate it if you have time to test
> > this series on your hardware, and drop a Tested-by.
> >
> > https://lore.kernel.org/linux-clk/20260603-clk-sync-state-v1-0-457120ee=
d200@redhat.com/
> >
> > I have a new series ready that I'm planning to post tomorrow. I'm
> > waiting to hear back about the ongoing conversation on that thread.
> >
> > Once this lands, there shouldn't be much need for the CLK_IGNORE_UNUSED
> > flag. I'm curious if you revert this patch in your tree if the need for=
 the
> > flag goes away with the sync_state changes applied.
> >
> > Let's get your change in the tree though. If we merged sync_state today=
,
> > it won't be eligible to be backported to the stable kernels, and the
> > CLK_IGNORE_UNUSED flag is an easier backport.
> >
>
> Hi Brian,
>
> Thank you for your patch set above. However, we still need this fix patch
> at the moment, because gate_noc_nsp_clk still needs to be enabled when
> accessing PCIe.

Yes, I agree this is also needed.

Brian

