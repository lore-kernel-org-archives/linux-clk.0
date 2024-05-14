Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D62181BBF
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715724254; cv=none; b=gM1TQvo6ffuwffUGFyJdRNpWjL2fX0UfwE/riDhZeKnoAm+xT28DeEYWrOGJ9/nU7LANhw6XW1b+h1+PiiCs3HnxuOM5tZiVMmDWV+7JF9uXc6LOBRSLjwQU7yy8tC5DrqsqZJxh/8G8ATfZzSNOhW6AhoCQ9XzRNLwgGfg5R4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715724254; c=relaxed/simple;
	bh=/sEZTtYji0CM+5KTJwPtfH5Dc6EqMAwSyWQb29nAG8c=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=p2JXoLkTQwxks297As4PWzPQYdxmcex3v82VmEGh8zR45PIyj8TdRU7H7UeRRHEEQHcDGsTZ65UpOD452SoYqzQEY9fgeQm/EklP4TKgNnoVMf4DZGPTRxQgSATNoR4JYO5SEoS6iCixxkl4IebL0CYdLJSQoXxM/XiS+WYNNbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCq0S630; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCq0S630"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF4CC32782;
	Tue, 14 May 2024 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715724254;
	bh=/sEZTtYji0CM+5KTJwPtfH5Dc6EqMAwSyWQb29nAG8c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hCq0S630Q7exWHcrQ8URsKMchUkRxv8K0pzU6RxWQpz4Y57Rct+/fB89LHZ/krmqk
	 QmHaTMo+9K0Vh4TS0tBOJ1MSbW5zVMD29oM+tDy+hMpaH/L2Ft6YaUBCKcTF6mq5ou
	 5kys8SmuxwMAhEW98ls7ttdhXWFMwUrGGbfnfvsWBrGk59RSA4YPrY1IJkkuHZ3AGW
	 Myyp9chameT19x0bzPmYVR+upKYReVsd4q4LXtUPFa4ClcxrM7q813JyZ2rDptpE3k
	 DR9Nb7DxQF8xr+9WaFhs+YSJdCGXm+rddL9lAKjHTRXX/Bh8XTxd9RUYVGcrqu//JX
	 /OoK/yXuQU8kw==
Message-ID: <9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com> <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org> <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
From: Stephen Boyd <sboyd@kernel.org>
Cc: KUnit Development <kunit-dev@googlegroups.com>, linux-clk@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Audra Mitchell <aubaker@redhat.com>, Donald Zickus <dzickus@redhat.com>
To: Nico Pache <npache@redhat.com>
Date: Tue, 14 May 2024 15:04:12 -0700
User-Agent: alot/0.10

Quoting Nico Pache (2024-05-14 00:14:24)
> Hi Stephen,
>=20
> Yes, we have that commit. This is failing on fedora-ark, so it's
> constantly updated to match upstream, and the earliest recorded
> instance of it failing in our environment is v6.1.
>=20

Please don't top post. I'm unable to run s390 kunit tests in qemu. They
seem to crash before finishing.

 ./tools/testing/kunit/kunit.py run --kunitconfig=3Dlib/kunit --arch=3Ds390=
 --cross_compile=3D/path/to/s390-linux-

[14:55:10] Starting KUnit Kernel (1/1)...
[14:55:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Running tests with:
$ qemu-system-s390x -nodefaults -m 1024 -kernel .kunit/arch/s390/boot/bzIma=
ge -append 'kunit.enable=3D1 console=3DttyS0 kunit_shutdown=3Dreboot' -no-r=
eboot -nographic -serial stdio -machine s390-ccw-virtio -cpu qemu
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D example_init=
 (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] example_init_test
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] =
example_init =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_executor_test (8 s=
ubtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] parse_filter_test
[14:55:11] [PASSED] filter_suites_test
[14:55:11] [PASSED] filter_suites_test_glob_test
[14:55:11] [PASSED] filter_suites_to_empty_test
[14:55:11] [PASSED] parse_filter_attr_test
[14:55:11] [PASSED] filter_attr_test
[14:55:11] [PASSED] filter_attr_empty_test
[14:55:11] [PASSED] filter_attr_skip_test
[14:55:11] [ERROR] Test: kunit_executor_test: Expected test number 1 but fo=
und 2
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] kunit_exe=
cutor_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-try-catch-test (2 sub=
tests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_test_try_catch_successful_try_no_catch
[14:55:11] [PASSED] kunit_test_try_catch_unsuccessful_try_does_catch
[14:55:11] [ERROR] Test: kunit-try-catch-test: Expected test number 1 but f=
ound 3
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] kunit-try-ca=
tch-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-resource-test (12 sub=
tests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_resource_test_init_resources
[14:55:11] [PASSED] kunit_resource_test_alloc_resource
[14:55:11] [PASSED] kunit_resource_test_destroy_resource
[14:55:11] [PASSED] kunit_resource_test_remove_resource
[14:55:11] [PASSED] kunit_resource_test_cleanup_resources
[14:55:11] [PASSED] kunit_resource_test_proper_free_ordering
[14:55:11] [PASSED] kunit_resource_test_static
[14:55:11] [PASSED] kunit_resource_test_named
[14:55:11] [PASSED] kunit_resource_test_action
[14:55:11] [PASSED] kunit_resource_test_remove_action
[14:55:11] [PASSED] kunit_resource_test_release_action
[14:55:11] [PASSED] kunit_resource_test_action_ordering
[14:55:11] [ERROR] Test: kunit-resource-test: Expected test number 1 but fo=
und 4
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] kunit-res=
ource-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-log-test (2 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_log_test
[14:55:11] [SKIPPED] kunit_log_newline_test
[14:55:11] [ERROR] Test: kunit-log-test: Expected test number 1 but found 5
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] kun=
it-log-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_status (2=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_status_set_failure_test
[14:55:11] [PASSED] kunit_status_mark_skipped_test
[14:55:11] [ERROR] Test: kunit_status: Expected test number 1 but found 6
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] =
kunit_status =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_current (=
2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_current_test
[14:55:11] [PASSED] kunit_current_fail_test
[14:55:11] [ERROR] Test: kunit_current: Expected test number 1 but found 7
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] =
kunit_current =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_device (3=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] kunit_device_test
[14:55:11] [PASSED] kunit_device_cleanup_test
[14:55:11] [PASSED] kunit_device_driver_test
[14:55:11] [ERROR] Test: kunit_device: Expected test number 1 but found 8
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] =
kunit_device =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D string-stream-test (12 s=
ubtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] string_stream_managed_init_test
[14:55:11] [PASSED] string_stream_unmanaged_init_test
[14:55:11] [PASSED] string_stream_managed_free_test
[14:55:11] [PASSED] string_stream_resource_free_test
[14:55:11] [PASSED] string_stream_line_add_test
[14:55:11] [PASSED] string_stream_variable_length_line_test
[14:55:11] [PASSED] string_stream_append_test
[14:55:11] [PASSED] string_stream_append_auto_newline_test
[14:55:11] [PASSED] string_stream_append_empty_string_test
[14:55:11] [PASSED] string_stream_no_auto_newline_test
[14:55:11] [PASSED] string_stream_auto_newline_test
[14:55:11] [PASSED] string_stream_performance_test
[14:55:11] [ERROR] Test: string-stream-test: Expected test number 1 but fou=
nd 9
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] string-st=
ream-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D exampl=
e (9 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] [PASSED] example_simple_test
[14:55:11] [SKIPPED] example_skip_test
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11]
[14:55:11] # example_mark_skipped_test: initializing
[14:55:11]
[14:55:11] # example_mark_skipped_test: You should see a line below.
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: example: missing subtest result line!
[14:55:11]
[14:55:11] # module: kunit_example_test
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [CR=
ASHED] example =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
[14:55:11]
[14:55:11] # example: initializing suite
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D [CRASHED]  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] [ERROR] Test: main: missing expected subtest!
[14:55:11] [CRASHED]
[14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:55:11] Testing complete. Ran 62 tests: passed: 44, crashed: 16, skipped=
: 2, errors: 25
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | te=
e .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
[14:55:11] Elapsed time: 16.240s total, 1.476s configuring, 14.294s buildin=
g, 0.469s running

I wonder if something with my local environment is causing troubles.
