Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8CE10A1C
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715670958; cv=none; b=RR4ixyTm+PTN8kbk7x0BprP9r/T8Dgt4JtMUYcWbzqUe8g99zf57BETBPzY9s4WK+C9fCasdDpibQb465GAWQKkh6eZMUnfJyS3pqE6JuUKN1y3WdsTHRKNa2XcFvI3nRLg9zCn6k93+FGCcLm2ivFwyD+9hQHVuXC9ppWpj3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715670958; c=relaxed/simple;
	bh=q8zjG5QCQxQ+DRzV5oNwvqJTNBdPlcr2jgw89b4Gzd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCuTOYAob4uTcYE8/RF5507mNkdO4HmvJKizQn5wyzbxJ6/tnK7guc6dpk9ch9YrBsbQLbc/cwtn0cwSLU4u2wMRRwGVtOMdDj/YW70pGQvkN+ebDNZEiisPYbucRhal76sofrDjJ2oNC9WNLbu7V5ckOwsbtWHTnw9divK+Kvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAW5yMsi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAW5yMsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715670955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8zjG5QCQxQ+DRzV5oNwvqJTNBdPlcr2jgw89b4Gzd0=;
	b=HAW5yMsi8MOzSI4AGhlk0rJ/D2xO1z3HnEOayb1uKNogrpcW6HHyerAgms3wCUX03HBz1N
	rwcRUhfUuugMMdbmH0iT9AZMAPZ1BRJ1IdaAXfZ/NHsam3HywZ8g/CS/qdlhS9KNd9Dj3L
	n0vREYpJRRCEXqpFm4ZKkGIVtjGgQu0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-3cqB2fhDNtqBAbDyUIAlxQ-1; Tue, 14 May 2024 03:14:51 -0400
X-MC-Unique: 3cqB2fhDNtqBAbDyUIAlxQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-61510f72bb3so100697827b3.0
        for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 00:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670890; x=1716275690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8zjG5QCQxQ+DRzV5oNwvqJTNBdPlcr2jgw89b4Gzd0=;
        b=bYWX/hkAhgxNaJ1DD/Hb1aop1C09kitfRu0h1hWXeiJPP1lVEG0ZczX++bOTBdQIbr
         oC+Vx91/LzUM6q6zGvDDlFZ+a8Qv3fyem8+QzUqZGGmsZ7fTt8BSjCot+cDtTvyiS/ix
         ysJmsL++T4rlPih6VECF9IihZasR4B5quGaocmU52i0a2e/jnwd3hoAewpdSLhee7osL
         AmKow92X4VZl510hd0+2N4I7JoUhoOow2FEZxhgDUTGVvJ1R+TDUu+0pK9R8sdlBaEXZ
         hgO6DE70n5DQ5m+OMsR0R9xhVNr9RT0/EMvm/zRCJ68FbQ5rBkJKVF7WZ0PFIoSCE9eG
         o4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5loAJSCbt0zwLtd12eGTZblLED04fu5ncqUIFiMqpcpUNfBjf1SiEguWeeFe0klagIIa1SBlHy/oGbxLxyz4BtvXIDY9sdtBk
X-Gm-Message-State: AOJu0YzFQ3UzR9nzqP+39amqydolBAKELNFC21kAGkAlKNWdrYVWK5er
	ZHiaLV5Pa8F1gJltl6mC+GFUH4BftCjbneH8/2W+yKyx8TcY9FndxA8ww6MB5CQlNHmjZvkP4ty
	AalJwn6UgIzcxR1l9ufN33hWFWvTca5X0CbdM7aHwfoFwOnFN2TYgAmnfFUZ3BphVZnLMMAmt0c
	sOEKjcMjeZxuc0Cczn5ZHEoSo8OjU7s4ee
X-Received: by 2002:a05:690c:660e:b0:61b:33fb:5759 with SMTP id 00721157ae682-622aff923ebmr146785507b3.1.1715670890416;
        Tue, 14 May 2024 00:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnO5dkSr6TP0rQ/LVeOnvGSi+Q3dNJUXCcWp6CoGWF5snWhQl9JwDSkczYkgUxZbuJI8lI9zQOS3yQU0ewsT4=
X-Received: by 2002:a05:690c:660e:b0:61b:33fb:5759 with SMTP id
 00721157ae682-622aff923ebmr146785367b3.1.1715670890078; Tue, 14 May 2024
 00:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
 <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
In-Reply-To: <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 14 May 2024 01:14:24 -0600
Message-ID: <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
To: Stephen Boyd <sboyd@kernel.org>
Cc: KUnit Development <kunit-dev@googlegroups.com>, linux-clk@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Audra Mitchell <aubaker@redhat.com>, 
	Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Yes, we have that commit. This is failing on fedora-ark, so it's
constantly updated to match upstream, and the earliest recorded
instance of it failing in our environment is v6.1.

Cheers,
-- Nico

On Mon, May 13, 2024 at 9:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Nico Pache (2024-05-13 18:08:40)
> > Hi,
> >
> > We are seeing a number of the CLK kunit tests failing on S390x. This
> > has been occurring for some time now (as early as v6.1). We run these
> > tests as modules (without the UML wrappers), and have not seen these
> > failures on any other architectures.
>
> Do you have commit 75357829cc8e ("clk: Fix clk gate kunit test on
> big-endian CPUs"). What is the kernel version?
>

